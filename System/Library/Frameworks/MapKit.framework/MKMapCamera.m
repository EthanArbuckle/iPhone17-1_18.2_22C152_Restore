@interface MKMapCamera
+ (BOOL)supportsSecureCoding;
+ (CLLocationCoordinate2D)_adjustCoordinateForPitch:(CLLocationCoordinate2D)a3 heading:(double)a4 pitch:(double)a5 minimumPitchRequiredForAdjustment:(double)a6 tolerance:(double)a7;
+ (MKMapCamera)camera;
+ (MKMapCamera)cameraLookingAtCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate fromDistance:(CLLocationDistance)distance pitch:(CGFloat)pitch heading:(CLLocationDirection)heading;
+ (MKMapCamera)cameraLookingAtCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate fromEyeCoordinate:(CLLocationCoordinate2D)eyeCoordinate eyeAltitude:(CLLocationDistance)eyeAltitude;
+ (MKMapCamera)cameraLookingAtMapItem:(MKMapItem *)mapItem forViewSize:(CGSize)viewSize allowPitch:(BOOL)allowPitch;
+ (id)_cameraLookingAtGEOMapRect:(id *)a3 aspectRatio:(float)a4;
+ (id)_cameraLookingAtMapRect:(id)a3 forViewSize:(CGSize)a4;
+ (id)_cameraLookingAtScene:(id)a3;
+ (unint64_t)_sizeCategoryForViewSize:(CGSize)a3;
- ($FD2884BA735A6398BD92EEF91FE53E55)_enclosingGEOMapRectForAspectRatio:(float)a3;
- (BOOL)_validate;
- (BOOL)isEqual:(id)a3;
- (CGFloat)pitch;
- (CLLocationCoordinate2D)centerCoordinate;
- (CLLocationDirection)heading;
- (CLLocationDistance)altitude;
- (CLLocationDistance)centerCoordinateDistance;
- (MKMapCamera)initWithCoder:(id)a3;
- (double)_precisePitch;
- (id)_mapView;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)_mapViewStateChanged;
- (void)_setMapView:(id)a3;
- (void)_setPrecisePitch:(double)a3;
- (void)_updateState;
- (void)encodeWithCoder:(id)a3;
- (void)setAltitude:(CLLocationDistance)altitude;
- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate;
- (void)setCenterCoordinateDistance:(CLLocationDistance)centerCoordinateDistance;
- (void)setHeading:(CLLocationDirection)heading;
@end

@implementation MKMapCamera

- (void)_mapViewStateChanged
{
  self->_needsStateUpdate = 1;
}

- (void)_updateState
{
  self->_needsStateUpdate = 0;
  p_mapView = &self->_mapView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  if (WeakRetained)
  {
    v5 = (id *)objc_loadWeakRetained((id *)p_mapView);
    id v11 = v5[83];

    [v11 centerCoordinate];
    if (v7 >= -180.0 && v7 <= 180.0 && v6 >= -90.0 && v6 <= 90.0)
    {
      self->_centerCoordinate.latitude = v6;
      self->_centerCoordinate.longitude = v7;
      [v11 presentationYaw];
      if (v8 < 0.0 || v8 >= 360.0)
      {
        double v8 = fmod(v8, 360.0);
        if (v8 < 0.0) {
          double v8 = v8 + 360.0;
        }
      }
      self->_heading = v8;
      [v11 pitch];
      self->_pitch = v9;
      [v11 altitude];
      self->_altitude = v10;
    }
  }
}

- (void).cxx_destruct
{
}

- (void)setAltitude:(CLLocationDistance)altitude
{
  self->_pitchAdjustsAltitude = 0;
  if (vabdd_f64(self->_altitude, altitude) >= 0.00000011920929)
  {
    [(MKMapCamera *)self willChangeValueForKey:@"altitude"];
    [(MKMapCamera *)self willChangeValueForKey:@"centerCoordinateDistance"];
    self->_altitude = altitude;
    [(MKMapCamera *)self didChangeValueForKey:@"altitude"];
    [(MKMapCamera *)self didChangeValueForKey:@"centerCoordinateDistance"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    [WeakRetained _updateFromCamera:self];
  }
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate
{
  CLLocationDegrees longitude = centerCoordinate.longitude;
  CLLocationDegrees latitude = centerCoordinate.latitude;
  if (vabdd_f64(self->_centerCoordinate.latitude, centerCoordinate.latitude) >= 0.00000000999999994
    || vabdd_f64(self->_centerCoordinate.longitude, centerCoordinate.longitude) >= 0.00000000999999994)
  {
    [(MKMapCamera *)self willChangeValueForKey:@"centerCoordinate"];
    self->_centerCoordinate.CLLocationDegrees latitude = latitude;
    self->_centerCoordinate.CLLocationDegrees longitude = longitude;
    [(MKMapCamera *)self didChangeValueForKey:@"centerCoordinate"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    [WeakRetained _updateFromCamera:self];
  }
}

- (void)_setMapView:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(MKMapCamera *)self centerCoordinate];
  objc_msgSend(v4, "setCenterCoordinate:");
  [(MKMapCamera *)self heading];
  objc_msgSend(v4, "setHeading:");
  [(MKMapCamera *)self pitch];
  objc_msgSend(v4, "setPitch:");
  [(MKMapCamera *)self altitude];
  objc_msgSend(v4, "setAltitude:");
  v4[56] = self->_pitchAdjustsAltitude;
  return v4;
}

- (CLLocationDirection)heading
{
  if (self->_needsStateUpdate) {
    [(MKMapCamera *)self _updateState];
  }
  return self->_heading;
}

- (CLLocationDistance)altitude
{
  if (self->_needsStateUpdate) {
    [(MKMapCamera *)self _updateState];
  }
  return self->_altitude;
}

- (void)setHeading:(CLLocationDirection)heading
{
  if (vabdd_f64(self->_heading, heading) >= 0.00000011920929)
  {
    [(MKMapCamera *)self willChangeValueForKey:@"heading"];
    self->_heading = heading;
    [(MKMapCamera *)self didChangeValueForKey:@"heading"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    [WeakRetained _updateFromCamera:self];
  }
}

- (void)_setPrecisePitch:(double)a3
{
  if (vabdd_f64(self->_pitch, a3) >= 0.00000011920929)
  {
    if (self->_pitchAdjustsAltitude)
    {
      [(MKMapCamera *)self willChangeValueForKey:@"altitude"];
      [(MKMapCamera *)self centerCoordinateDistance];
      self->_altitude = cos(a3 * 0.0174532925) * v5;
      [(MKMapCamera *)self didChangeValueForKey:@"altitude"];
    }
    [(MKMapCamera *)self willChangeValueForKey:@"pitch"];
    self->_pitch = a3;
    [(MKMapCamera *)self didChangeValueForKey:@"pitch"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    [WeakRetained _updateFromCamera:self];
  }
}

- (CLLocationCoordinate2D)centerCoordinate
{
  if (self->_needsStateUpdate) {
    [(MKMapCamera *)self _updateState];
  }
  double latitude = self->_centerCoordinate.latitude;
  double longitude = self->_centerCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (CGFloat)pitch
{
  if (self->_needsStateUpdate) {
    [(MKMapCamera *)self _updateState];
  }
  return self->_pitch;
}

- (BOOL)_validate
{
  [(MKMapCamera *)self centerCoordinate];
  BOOL v5 = v4 >= -180.0;
  if (v4 > 180.0) {
    BOOL v5 = 0;
  }
  if (v3 < -90.0) {
    BOOL v5 = 0;
  }
  BOOL v6 = v3 <= 90.0 && v5;
  if (!v6)
  {
    double v7 = NSString;
    [(MKMapCamera *)self centerCoordinate];
    double v10 = [NSString stringWithFormat:@"%+.8f, %+.8f", v8, v9];
    id v11 = [v7 stringWithFormat:@"Invalid camera centerCoordinate %@", v10];

    v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0];
    [v12 raise];
  }
  return v6;
}

+ (MKMapCamera)camera
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return (MKMapCamera *)v2;
}

+ (MKMapCamera)cameraLookingAtCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate fromEyeCoordinate:(CLLocationCoordinate2D)eyeCoordinate eyeAltitude:(CLLocationDistance)eyeAltitude
{
  double longitude = eyeCoordinate.longitude;
  double latitude = eyeCoordinate.latitude;
  double v8 = centerCoordinate.longitude;
  double v9 = centerCoordinate.latitude;
  double v10 = objc_msgSend((id)objc_opt_class(), "camera", *(void *)&eyeCoordinate.latitude, *(void *)&eyeCoordinate.longitude, *(void *)&centerCoordinate.latitude, *(void *)&centerCoordinate.longitude);
  objc_msgSend(v10, "setCenterCoordinate:", v9, v8);
  MKDirectionBetween(latitude, longitude, v9, v8);
  objc_msgSend(v10, "setHeading:");
  CLLocationCoordinate2DGetDistanceFrom();
  long double v12 = v11;
  if (eyeAltitude < 50.0) {
    eyeAltitude = 50.0;
  }
  for (double i = atan2(v11, eyeAltitude) * 57.2957795; i > 85.0; double i = atan2(v12, eyeAltitude) * 57.2957795)
    eyeAltitude = eyeAltitude + eyeAltitude;
  objc_msgSend(v10, "_setPrecisePitch:");
  [v10 setAltitude:eyeAltitude];

  return (MKMapCamera *)v10;
}

+ (MKMapCamera)cameraLookingAtCenterCoordinate:(CLLocationCoordinate2D)centerCoordinate fromDistance:(CLLocationDistance)distance pitch:(CGFloat)pitch heading:(CLLocationDirection)heading
{
  double longitude = centerCoordinate.longitude;
  double latitude = centerCoordinate.latitude;
  long double v11 = [(id)objc_opt_class() camera];
  objc_msgSend(v11, "setCenterCoordinate:", latitude, longitude);
  [v11 setHeading:heading];
  [v11 _setPrecisePitch:pitch];
  [v11 setAltitude:(double)(cos(pitch * 0.0174532925) * distance)];

  return (MKMapCamera *)v11;
}

+ (MKMapCamera)cameraLookingAtMapItem:(MKMapItem *)mapItem forViewSize:(CGSize)viewSize allowPitch:(BOOL)allowPitch
{
  BOOL v5 = allowPitch;
  double height = viewSize.height;
  double width = viewSize.width;
  uint64_t v205 = *MEMORY[0x1E4F143B8];
  double v9 = mapItem;
  double v10 = [(MKMapItem *)v9 _viewportFrame];

  if (v10)
  {
    long double v11 = [(MKMapItem *)v9 _viewportFrame];
    [v11 latitude];
    CLLocationDegrees v13 = v12;
    [v11 longitude];
    CLLocationCoordinate2D v17 = CLLocationCoordinate2DMake(v13, v14);
    CLLocationDegrees longitude = v17.longitude;
    CLLocationDegrees latitude = v17.latitude;
    if (!v5) {
      [(MKMapItem *)v9 _coordinate];
    }
    double v18 = MKTilePointForCoordinate(latitude, longitude, 21.0);
    double v20 = v19;
    [v11 distance];
    double v22 = v21;
    v23 = +[MKSystemController sharedInstance];
    [v23 screenSize];
    double v25 = v24;
    double v27 = v26;

    long double v28 = exp2(21.0 - v22);
    v29 = +[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", (double)(v18 - v25 / (1.0 / v28) * 0.5), (double)(v20 - v27 / (1.0 / v28) * 0.5), (double)(v25 / (1.0 / v28)), (double)(v27 / (1.0 / v28)), v25, v27);
    [v11 heading];
    [v29 setHeading:v30];
    [v11 pitch];
    [v29 setPitch:v31];
    if (width == v25 && height == v27)
    {
      id v32 = v29;
LABEL_99:

      goto LABEL_100;
    }
    v56 = (void *)[v29 copy];
    [v56 setHeading:0.0];
    [v56 setPitch:0.0];
    double v57 = width / height;
    *(float *)&double v58 = width / height;
    [v56 enclosingMapRectForAspectRatio:v58];
    double v60 = log2(width / v59) + 21.0;
    if (v60 >= 0.0) {
      double v61 = v60;
    }
    else {
      double v61 = 0.0;
    }
    [(MKMapItem *)v9 _coordinate];
    double v63 = v62;
    double v65 = v64;
    uint64_t v66 = objc_msgSend(a1, "_sizeCategoryForViewSize:", width, height);
    switch(v66)
    {
      case 2:
        [v11 distance];
        double v61 = v77;
        break;
      case 1:
        double v67 = 80.0 / width + -0.300000012;
        double v68 = v57 / 1.75;
        goto LABEL_29;
      case 0:
        double v67 = 30.0 / width + 1.29999995;
        double v68 = v57 * 0.125;
LABEL_29:
        double v79 = v67 + v68;
        [v11 distance];
        double v61 = v80 - v79;
        *(double *)&uint64_t v78 = 40.0;
LABEL_30:
        double v81 = *(double *)&v78;
        [v11 pitch];
        double v194 = height;
        if (v81 < v82 && v5)
        {
          [v11 heading];
          double v84 = v83;
          [v11 pitch];
          objc_msgSend(a1, "_adjustCoordinateForPitch:heading:pitch:minimumPitchRequiredForAdjustment:tolerance:", v63, v65, v84, v85, v81, 5000.0);
          double v63 = v86;
          double v65 = v87;
        }
        double v88 = MKTilePointForCoordinate(v63, v65, 21.0);
        double v90 = v89;
        double v91 = 6.0;
        if (v61 > 15.0) {
          double v91 = 21.0 - v61;
        }
        long double v92 = 1.0 / exp2(v91);
        double v193 = width;
        double v93 = width / v92;
        double v94 = v194 / v92;
        double v95 = v88 - v93 * 0.5;
        double v96 = v90 - v194 / v92 * 0.5;
        if ([v11 hasViewTargetBounds])
        {
          double v189 = v65;
          [v11 minViewTargetBounds];
          double v98 = v97;
          [v11 maxViewTargetBounds];
          double v100 = v98 - v99;
          GEOCalculateDistance();
          double v102 = sqrt(v100 * v100 + v101 * v101);
          [v11 maxViewTargetBounds];
          double v104 = v103;
          if (v102 <= v103) {
            double v105 = v103;
          }
          else {
            double v105 = v102;
          }
          double v106 = 0.699999988;
          if (v102 < v103) {
            double v106 = 0.5;
          }
          MKMapRectMakeWithRadialDistance(v17.latitude, v17.longitude, v106 * (v105 * 0.5));
          if (v108 <= v93)
          {
            double v65 = v189;
          }
          else
          {
            if (v107 > v94)
            {
              double v109 = dbl_18BD1B610[v102 < v104];
              double v93 = v93 * v109;
              double v94 = v94 * v109;
            }
            double v65 = v189;
          }
        }
        +[MKMapCamera _cameraLookingAtMapRect:forViewSize:](MKMapCamera, "_cameraLookingAtMapRect:forViewSize:", v95, v96, v93, v94, v193, v194);
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        [v11 heading];
        [v32 setHeading:v174];
        objc_msgSend(v32, "setCenterCoordinate:", v63, v65);
        double v175 = 0.0;
        if (v5)
        {
          objc_msgSend(v11, "pitch", 0.0);
          double v175 = v176;
        }
        [v32 setPitch:v175];

        goto LABEL_99;
    }
    *(double *)&uint64_t v78 = 1.79769313e308;
    goto LABEL_30;
  }
  [(MKMapItem *)v9 _coordinate];
  double v35 = v33;
  if (v34 < -180.0 || (double v36 = v34, v34 > 180.0) || v33 < -90.0 || v33 > 90.0)
  {
    id v32 = +[MKMapCamera camera];
    goto LABEL_100;
  }
  unint64_t v37 = objc_msgSend(a1, "_sizeCategoryForViewSize:", width, height);
  double v38 = 0.0;
  double v39 = 0.0;
  if (v37 <= 2)
  {
    double v38 = dbl_18BD1B620[v37];
    double v39 = dbl_18BD1B638[v37];
  }
  double v185 = v38;
  double v186 = MKTilePointForCoordinate(v35, v36, 21.0);
  double v187 = v40;
  double v184 = v39;
  double v41 = 1.0 / exp2(21.0 - v39);
  v42 = [(MKMapItem *)v9 placemark];
  v43 = [v42 region];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v44 = v43;
    [v44 center];
    double v46 = v45;
    double v48 = v47;
    [v44 radius];
    double v50 = v49;

    double v51 = MKMapRectMakeWithRadialDistance(v46, v48, v50);
    double v53 = v52;
    double v188 = v55;
    double v190 = v54;
  }
  else
  {
    double v188 = 0.0;
    double v190 = 0.0;
    double v51 = INFINITY;
    double v53 = INFINITY;
  }
  double v192 = width / v41;
  double v191 = height / v41;
  v69 = [(MKMapItem *)v9 _geoMapItem];
  v70 = [v69 displayMapRegionOrNil];

  if (v70)
  {
    id v71 = v70;
    GEOMapRectForMapRegion();
    MKCoordinateRegionForMapRect(v207);

    GEOMapRectForCoordinateRegion();
    double v76 = v75;
  }
  else
  {
    double v73 = 0.0;
    double v76 = INFINITY;
    double v72 = INFINITY;
    double v74 = 0.0;
  }
  double v110 = v192 * 0.5;
  double v111 = v191 * 0.5;
  BOOL v112 = v76 == INFINITY;
  if (v72 != INFINITY) {
    BOOL v112 = 0;
  }
  if (v51 == INFINITY && v53 == INFINITY)
  {
    double v113 = width;
    double v115 = v186;
    double v114 = v187;
    if (v112)
    {
      double v188 = 0.0;
      double v190 = 0.0;
      double v51 = INFINITY;
      double v53 = INFINITY;
    }
    else
    {
      double v121 = v74;
      double v53 = v72;
      double v122 = v73;
      v123 = MKGetMKMapCameraLog();
      if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
      {
        v124 = NSString;
        v125 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v76, *(void *)&v53];
        v126 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v122, *(void *)&v121];
        double v127 = [v124 stringWithFormat:@"{%@, %@}", v125, v126];

        *(_DWORD *)buf = 138477827;
        double v200 = v127;
        _os_log_impl(&dword_18BAEC000, v123, OS_LOG_TYPE_INFO, "Only display framing data is present - display:%{private}@", buf, 0xCu);
      }
      double v51 = v76;
      double v188 = v121;
      double v190 = v122;
      double v111 = v191 * 0.5;
      double v115 = v186;
      double v114 = v187;
    }
  }
  else if (v112)
  {
    v116 = MKGetMKMapCameraLog();
    double v113 = width;
    double v115 = v186;
    double v114 = v187;
    if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
    {
      v117 = NSString;
      v118 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v51, *(void *)&v53];
      v119 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v190, *(void *)&v188];
      double v120 = [v117 stringWithFormat:@"{%@, %@}", v118, v119];

      *(_DWORD *)buf = 138477827;
      double v200 = v120;
      _os_log_impl(&dword_18BAEC000, v116, OS_LOG_TYPE_INFO, "Only placemark framing data is present - placemark:%{private}@", buf, 0xCu);
    }
    double v111 = v191 * 0.5;
  }
  else
  {
    double v181 = v74;
    double v182 = v72;
    double v183 = v73;
    double v180 = v53;
    double v197 = 0.0;
    double v198 = 0.0;
    double v195 = 0.0;
    double v196 = 0.0;
    v208.origin.x = v51;
    v208.origin.y = v53;
    double v128 = v188;
    double v129 = v190;
    v208.size.double width = v190;
    v208.size.double height = v188;
    MKCoordinateRegionForMapRect(v208);
    __61__MKMapCamera_cameraLookingAtMapItem_forViewSize_allowPitch___block_invoke(&v198, &v197);
    id v130 = v70;
    GEOMapRectForMapRegion();
    MKCoordinateRegionForMapRect(v209);

    __61__MKMapCamera_cameraLookingAtMapItem_forViewSize_allowPitch___block_invoke(&v196, &v195);
    BOOL v131 = v195 < v197 || v196 < v198;
    v132 = MKGetMKMapCameraLog();
    if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
    {
      *(double *)&v133 = COERCE_DOUBLE(@"placemark");
      if (v131) {
        *(double *)&v133 = COERCE_DOUBLE(@"display");
      }
      v178 = v133;
      v134 = NSString;
      [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v76, *(void *)&v182];
      v135 = v179 = v43;
      v136 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v183, *(void *)&v181];
      v137 = [v134 stringWithFormat:@"{%@, %@}", v135, v136];

      v138 = NSString;
      id v139 = v137;
      v140 = [v138 stringWithFormat:@"{%.1f, %.1f}", *(void *)&v51, *(void *)&v180];
      v141 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v190, *(void *)&v188];
      v142 = [v138 stringWithFormat:@"{%@, %@}", v140, v141];

      *(_DWORD *)buf = 138543875;
      double v200 = *(double *)&v178;
      __int16 v201 = 2113;
      v202 = v137;
      __int16 v203 = 2113;
      v204 = v142;
      _os_log_impl(&dword_18BAEC000, v132, OS_LOG_TYPE_INFO, "Will prefer %{public}@ framing data - display:%{private}@ placemark:%{private}@", buf, 0x20u);

      v43 = v179;
    }

    if (v131) {
      double v51 = v76;
    }
    double v143 = v180;
    if (v131) {
      double v143 = v182;
    }
    double v111 = v191 * 0.5;
    if (v131)
    {
      double v129 = v183;
      double v128 = v181;
    }
    double v188 = v128;
    double v190 = v129;
    double v113 = width;
    double v115 = v186;
    double v114 = v187;
    double v110 = v192 * 0.5;
    double v53 = v143;
  }
  double v144 = v115 - v110;
  double v145 = v114 - v111;
  if (v51 == INFINITY && v53 == INFINITY)
  {
    v146 = MKGetMKMapCameraLog();
    if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
    {
      v147 = NSString;
      v148 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v144, *(void *)&v145];
      v149 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v192, *(void *)&v191];
      v150 = [v147 stringWithFormat:@"{%@, %@}", v148, v149];

      *(_DWORD *)buf = 134349315;
      double v200 = v184;
      __int16 v201 = 2113;
      v202 = v150;
      v151 = "No framing data is present - zoomLevel:%{public}f zoom:%{private}@";
LABEL_80:
      _os_log_impl(&dword_18BAEC000, v146, OS_LOG_TYPE_INFO, v151, buf, 0x16u);
    }
  }
  else
  {
    v210.origin.x = v144;
    v210.origin.y = v114 - v111;
    v210.size.double height = v191;
    v210.size.double width = v192;
    v211.origin.x = v51;
    v211.origin.y = v53;
    v211.size.double height = v188;
    v211.size.double width = v190;
    BOOL v152 = MKMapRectContainsRect(v210, v211);
    v146 = MKGetMKMapCameraLog();
    BOOL v153 = os_log_type_enabled(v146, OS_LOG_TYPE_INFO);
    if (!v152)
    {
      if (v153)
      {
        v157 = NSString;
        v158 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v144, *(void *)&v145];
        v159 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v192, *(void *)&v191];
        v160 = [v157 stringWithFormat:@"{%@, %@}", v158, v159];

        *(_DWORD *)buf = 134349315;
        double v200 = v184;
        __int16 v201 = 2113;
        v202 = v160;
        _os_log_impl(&dword_18BAEC000, v146, OS_LOG_TYPE_INFO, "Framing data rect is too large to fit in zoom level rect - zoomLevel:%{public}f zoom:%{private}@", buf, 0x16u);
      }
      double v144 = v51;
      double v145 = v53;
      double v191 = v188;
      double v192 = v190;
      goto LABEL_85;
    }
    if (v153)
    {
      v154 = NSString;
      v155 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v144, *(void *)&v145];
      v156 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&v192, *(void *)&v191];
      v150 = [v154 stringWithFormat:@"{%@, %@}", v155, v156];

      *(_DWORD *)buf = 134349315;
      double v200 = v184;
      __int16 v201 = 2113;
      v202 = v150;
      v151 = "Framing data rect fits within zoom level rect - zoomLevel:%{public}f zoom:%{private}@";
      goto LABEL_80;
    }
  }

LABEL_85:
  objc_msgSend(a1, "_cameraLookingAtMapRect:forViewSize:", v144, v145, v192, v191, v113, height);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  if (v185 > 0.0)
  {
    v161 = objc_msgSend(a1, "_cameraLookingAtMapRect:forViewSize:", v115 - v113 / 0.14358737 * 0.5, v114 - height / 0.14358737 * 0.5, v113 / 0.14358737, height / 0.14358737, v113, height);
    [v32 centerCoordinateDistance];
    double v163 = v162;
    [v161 centerCoordinateDistance];
    double v165 = v164;
    v166 = MKGetMKMapCameraLog();
    BOOL v167 = os_log_type_enabled(v166, OS_LOG_TYPE_INFO);
    if (v163 <= v165)
    {
      if (v167)
      {
        [v32 centerCoordinateDistance];
        v172 = v171;
        [v161 centerCoordinateDistance];
        *(_DWORD *)buf = 134349568;
        double v200 = v185;
        __int16 v201 = 2050;
        v202 = v172;
        __int16 v203 = 2050;
        v204 = v173;
        _os_log_impl(&dword_18BAEC000, v166, OS_LOG_TYPE_INFO, "Pitching the camera %{public}f degrees - camera:%{public}f max:%{public}f", buf, 0x20u);
      }

      [v32 setPitch:v185];
    }
    else
    {
      if (v167)
      {
        [v32 centerCoordinateDistance];
        double v169 = v168;
        [v161 centerCoordinateDistance];
        *(_DWORD *)buf = 134349312;
        double v200 = v169;
        __int16 v201 = 2050;
        v202 = v170;
        _os_log_impl(&dword_18BAEC000, v166, OS_LOG_TYPE_INFO, "Not pitching the camera - camera:%{public}f max:%{public}f", buf, 0x16u);
      }
    }
  }

LABEL_100:

  return (MKMapCamera *)v32;
}

uint64_t __61__MKMapCamera_cameraLookingAtMapItem_forViewSize_allowPitch___block_invoke(void *a1, void *a2)
{
  v8.CLLocationDegrees latitude = 0.0;
  v8.CLLocationDegrees longitude = 0.0;
  v7.CLLocationDegrees latitude = 0.0;
  v7.CLLocationDegrees longitude = 0.0;
  MKCoordinatesForRegion(&v8, &v7);
  GEOCalculateDistance();
  *a2 = v4;
  uint64_t result = GEOCalculateDistance();
  *a1 = v6;
  return result;
}

+ (CLLocationCoordinate2D)_adjustCoordinateForPitch:(CLLocationCoordinate2D)a3 heading:(double)a4 pitch:(double)a5 minimumPitchRequiredForAdjustment:(double)a6 tolerance:(double)a7
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  double v9 = a5 / a6 / -a7;
  __double2 v10 = __sincos_stret((360.0 - a4) * 3.14159265 / 180.0);

  CLLocationCoordinate2D v13 = CLLocationCoordinate2DMake(latitude - v9 * v10.__cosval, longitude + v9 * v10.__sinval);
  double v12 = v13.longitude;
  double v11 = v13.latitude;
  result.double longitude = v12;
  result.double latitude = v11;
  return result;
}

+ (unint64_t)_sizeCategoryForViewSize:(CGSize)a3
{
  if (a3.width < 200.0) {
    return 0;
  }
  if (a3.width > 428.0) {
    return 2;
  }
  if (a3.width >= a3.height) {
    return 1;
  }
  if (a3.width <= 300.0) {
    return 1;
  }
  return 2;
}

+ (id)_cameraLookingAtGEOMapRect:(id *)a3 aspectRatio:(float)a4
{
  VKCameraPropertiesForRect();
  BOOL v5 = [a1 camera];
  objc_msgSend(v5, "setCenterCoordinate:", 0.0, 0.0);
  [v5 setAltitude:0.0];

  return v5;
}

+ (id)_cameraLookingAtMapRect:(id)a3 forViewSize:(CGSize)a4
{
  $FD2884BA735A6398BD92EEF91FE53E55 v7 = a3;
  CGFloat v4 = a4.width / a4.height;
  *(float *)&CGFloat v4 = a4.width / a4.height;
  BOOL v5 = [a1 _cameraLookingAtGEOMapRect:&v7 aspectRatio:v4];

  return v5;
}

+ (id)_cameraLookingAtScene:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 _mapItem];
  BOOL v5 = [(id)v4 _geoMapItem];
  uint64_t v6 = [v5 _storefrontPresentationInfo];

  LOBYTE(v4) = [v3 _wantsCloseUpView];
  if (v4)
  {
    $FD2884BA735A6398BD92EEF91FE53E55 v7 = [v6 closeUpView];
  }
  else
  {
    CLLocationCoordinate2D v8 = [v6 standOffView];
    double v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v6 closeUpView];
    }
    $FD2884BA735A6398BD92EEF91FE53E55 v7 = v10;
  }
  VKCameraPropertiesForStoreFrontView();
  double v11 = [(id)objc_opt_class() camera];
  objc_msgSend(v11, "setCenterCoordinate:", 0.0, 0.0);
  [v11 setAltitude:0.0];
  [v11 setHeading:0.0];
  [v11 setPitch:0.0];

  return v11;
}

- ($FD2884BA735A6398BD92EEF91FE53E55)_enclosingGEOMapRectForAspectRatio:(float)a3
{
  [(MKMapCamera *)self centerCoordinate];
  [(MKMapCamera *)self heading];
  [(MKMapCamera *)self pitch];
  [(MKMapCamera *)self altitude];
  GEOMapRectEnclosingCameraProperties();
  result.var1.var1 = v7;
  result.var1.var0 = v6;
  result.var0.var1 = v5;
  result.var0.var0 = v4;
  return result;
}

- (MKMapCamera)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKMapCamera;
  double v5 = [(MKMapCamera *)&v12 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"centerCoordinate.latitude"];
    v5->_centerCoordinate.double latitude = v6;
    [v4 decodeDoubleForKey:@"centerCoordinate.longitude"];
    v5->_centerCoordinate.double longitude = v7;
    [v4 decodeDoubleForKey:@"heading"];
    v5->_heading = v8;
    [v4 decodeDoubleForKey:@"pitch"];
    v5->_pitch = v9;
    [v4 decodeDoubleForKey:@"altitude"];
    v5->_altitude = v10;
    v5->_pitchAdjustsAltitude = [v4 decodeBoolForKey:@"pitchAdjustsAltitude"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (self->_needsStateUpdate) {
    [(MKMapCamera *)self _updateState];
  }
  [v4 encodeDouble:@"centerCoordinate.latitude" forKey:self->_centerCoordinate.latitude];
  [v4 encodeDouble:@"centerCoordinate.longitude" forKey:self->_centerCoordinate.longitude];
  [v4 encodeDouble:@"heading" forKey:self->_heading];
  [v4 encodeDouble:@"pitch" forKey:self->_pitch];
  [v4 encodeDouble:@"altitude" forKey:self->_altitude];
  [v4 encodeBool:self->_pitchAdjustsAltitude forKey:@"pitchAdjustsAltitude"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = (double *)v4;
    BOOL v6 = self->_centerCoordinate.latitude == v5[1]
      && self->_centerCoordinate.longitude == v5[2]
      && self->_heading == v5[3]
      && self->_pitch == v5[4]
      && self->_altitude == v5[5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return WeakRetained;
}

- (CLLocationDistance)centerCoordinateDistance
{
  if (self->_needsStateUpdate) {
    [(MKMapCamera *)self _updateState];
  }
  double altitude = self->_altitude;
  return altitude / cos(self->_pitch * 0.0174532925);
}

- (void)setCenterCoordinateDistance:(CLLocationDistance)centerCoordinateDistance
{
  self->_pitchAdjustsAltitude = 1;
  long double v4 = cos(self->_pitch * 0.0174532925) * centerCoordinateDistance;
  if (vabdd_f64(self->_altitude, v4) >= 0.00000011920929)
  {
    [(MKMapCamera *)self willChangeValueForKey:@"altitude"];
    [(MKMapCamera *)self willChangeValueForKey:@"centerCoordinateDistance"];
    self->_double altitude = v4;
    [(MKMapCamera *)self didChangeValueForKey:@"altitude"];
    [(MKMapCamera *)self didChangeValueForKey:@"centerCoordinateDistance"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
    [WeakRetained _updateFromCamera:self];
  }
}

- (id)description
{
  id v3 = NSString;
  long double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  BOOL v6 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&self->_centerCoordinate.latitude, *(void *)&self->_centerCoordinate.longitude];
  CLLocationDegrees v7 = [v3 stringWithFormat:@"<%@ %p centerCoordinate:%@ altitude:%.0fm heading:%.0f˚ pitch:%.0f˚>", v5, self, v6, *(void *)&self->_altitude, *(void *)&self->_heading, *(void *)&self->_pitch];

  return v7;
}

- (double)_precisePitch
{
  return self->_pitch;
}

@end