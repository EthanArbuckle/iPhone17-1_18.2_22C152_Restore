@interface NCWaypoint
+ (BOOL)supportsSecureCoding;
+ (NCWaypoint)idealizedSmartWaypoint;
+ (NCWaypoint)idealizedWaypoint;
+ (id)defaultMapGuideWaypointIconColor;
+ (id)guideWaypointInDbWithUUID:(id)a3 altitude:(id)a4;
+ (id)idealizedWaypointSymbolColor;
+ (id)parkedCarLabel;
+ (id)parkedCarSymbolColor;
+ (id)parkedCarWaypointWithUUID:(id)a3;
+ (id)randomizedWaypoint;
+ (id)sampleParkedCarWaypointWithLocation:(id)a3;
+ (id)waypointForCollectionPlaceItem:(id)a3 inGuide:(id)a4;
+ (id)waypointForCoreDataWaypoint:(id)a3;
+ (id)waypointForDescriptorWithUUID:(id)a3 creationTime:(id)a4 label:(id)a5 color:(id)a6 symbol:(id)a7 location:(id)a8 isEnabled:(BOOL)a9;
- (BOOL)isAltitudePopulated;
- (BOOL)isConnectivityWaypoint;
- (BOOL)isEnabled;
- (BOOL)isEquivalentCellularWaypoint:(id)a3;
- (BOOL)isParkedCarWaypoint;
- (BOOL)isSignificantlyDifferentFrom:(id)a3;
- (BOOL)isSystemWaypoint;
- (CLLocation)location;
- (NCWaypoint)initWithCoder:(id)a3;
- (NCWaypoint)initWithLabel:(id)a3 color:(id)a4 symbol:(id)a5 type:(int64_t)a6 location:(id)a7 altitude:(id)a8 isEnabled:(BOOL)a9;
- (NCWaypoint)initWithLabel:(id)a3 shortLabel:(id)a4 explanatoryDescription:(id)a5 color:(id)a6 highlightColor:(id)a7 symbol:(id)a8 type:(int64_t)a9 location:(id)a10 altitude:(id)a11 isEnabled:(BOOL)a12;
- (NCWaypoint)initWithUUID:(id)a3 creationTime:(id)a4 label:(id)a5 shortLabel:(id)a6 explanatoryDescription:(id)a7 color:(id)a8 highlightColor:(id)a9 symbol:(id)a10 type:(int64_t)a11 location:(id)a12 altitude:(id)a13 isEnabled:(BOOL)a14;
- (NCWaypoint)initWithUUID:(id)a3 label:(id)a4 shortLabel:(id)a5 explanatoryDescription:(id)a6 color:(id)a7 highlightColor:(id)a8 symbol:(id)a9 type:(int64_t)a10 location:(id)a11 altitude:(id)a12 isEnabled:(BOOL)a13;
- (NSDate)timestampOfCreation;
- (NSString)explanatoryDescription;
- (NSString)label;
- (NSString)shortLabel;
- (NSString)symbol;
- (NSUUID)guideUUID;
- (NSUUID)uuid;
- (UIColor)highlightColor;
- (UIColor)labelColor;
- (double)altitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setAltitudePopulated:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGuideUUID:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelColor:(id)a3;
- (void)setLocation:(id)a3;
- (void)setShortLabel:(id)a3;
- (void)setSymbol:(id)a3;
- (void)setTimestampOfCreation:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation NCWaypoint

- (BOOL)isSignificantlyDifferentFrom:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_location(self, v5, v6, v7);
  if (v8
    && (v12 = (void *)v8,
        objc_msgSend_location(v4, v9, v10, v11),
        v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    v17 = objc_msgSend_location(self, v14, v15, v16);
    v21 = objc_msgSend_location(v4, v18, v19, v20);
    objc_msgSend_distanceFromLocation_(v17, v22, (uint64_t)v21, v23);
    BOOL v25 = v24 >= 160.93;
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

+ (id)parkedCarSymbolColor
{
  if (qword_268921470 != -1) {
    dispatch_once(&qword_268921470, &unk_26EA48EC0);
  }
  v2 = (void *)qword_268921468;

  return v2;
}

+ (id)parkedCarLabel
{
  if (qword_268921480 != -1) {
    dispatch_once(&qword_268921480, &unk_26EA48EE0);
  }
  v2 = (void *)qword_268921478;

  return v2;
}

+ (id)idealizedWaypointSymbolColor
{
  if (qword_268921490 != -1) {
    dispatch_once(&qword_268921490, &unk_26EA48F00);
  }
  v2 = (void *)qword_268921488;

  return v2;
}

+ (id)defaultMapGuideWaypointIconColor
{
  if (qword_2689214A0 != -1) {
    dispatch_once(&qword_2689214A0, &unk_26EA48F20);
  }
  v2 = (void *)qword_268921498;

  return v2;
}

+ (NCWaypoint)idealizedWaypoint
{
  if (qword_2689214B0 != -1) {
    dispatch_once(&qword_2689214B0, &unk_26EA48F40);
  }
  v2 = (void *)qword_2689214A8;

  return (NCWaypoint *)v2;
}

+ (NCWaypoint)idealizedSmartWaypoint
{
  if (qword_2689214C0 != -1) {
    dispatch_once(&qword_2689214C0, &unk_26EA48F60);
  }
  v2 = (void *)qword_2689214B8;

  return (NCWaypoint *)v2;
}

+ (id)randomizedWaypoint
{
  id v2 = objc_alloc(MEMORY[0x263F00A50]);
  uint64_t v6 = objc_msgSend_initWithLatitude_longitude_(v2, v3, v4, v5, 37.280737, -121.997956);
  uint64_t v10 = objc_msgSend_numberWithDouble_(NSNumber, v7, v8, v9, 275.0);
  uint64_t v11 = [NCWaypoint alloc];
  uint64_t v15 = objc_msgSend_orangeColor(MEMORY[0x263F1C550], v12, v13, v14);
  char v19 = 1;
  isEnabled = objc_msgSend_initWithLabel_color_symbol_type_location_altitude_isEnabled_(v11, v16, @"Tent", (uint64_t)v15, @"house.fill", 4, v6, v10, v19);

  return isEnabled;
}

+ (id)parkedCarWaypointWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  uint64_t v9 = objc_msgSend_date(MEMORY[0x263EFF910], v6, v7, v8);
  uint64_t v13 = objc_msgSend_parkedCarLabel(NCWaypoint, v10, v11, v12);
  v17 = objc_msgSend_parkedCarSymbolColor(NCWaypoint, v14, v15, v16);
  char v21 = 1;
  isEnabled = objc_msgSend_initWithUUID_creationTime_label_shortLabel_explanatoryDescription_color_highlightColor_symbol_type_location_altitude_isEnabled_(v5, v18, (uint64_t)v4, (uint64_t)v9, v13, 0, 0, v17, 0, @"car.fill", 1, 0, 0, v21);

  return isEnabled;
}

+ (id)sampleParkedCarWaypointWithLocation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  uint64_t v9 = objc_msgSend_parkedCarLabel(NCWaypoint, v6, v7, v8);
  uint64_t v13 = objc_msgSend_parkedCarSymbolColor(NCWaypoint, v10, v11, v12);
  char v17 = 1;
  isEnabled = objc_msgSend_initWithLabel_color_symbol_type_location_altitude_isEnabled_(v5, v14, (uint64_t)v9, (uint64_t)v13, @"car.fill", 1, v4, 0, v17);

  return isEnabled;
}

- (NCWaypoint)initWithLabel:(id)a3 color:(id)a4 symbol:(id)a5 type:(int64_t)a6 location:(id)a7 altitude:(id)a8 isEnabled:(BOOL)a9
{
  return (NCWaypoint *)objc_msgSend_initWithLabel_shortLabel_explanatoryDescription_color_highlightColor_symbol_type_location_altitude_isEnabled_(self, a2, (uint64_t)a3, 0, 0, a4, 0, a5, a6, a7, a8, a9);
}

- (NCWaypoint)initWithLabel:(id)a3 shortLabel:(id)a4 explanatoryDescription:(id)a5 color:(id)a6 highlightColor:(id)a7 symbol:(id)a8 type:(int64_t)a9 location:(id)a10 altitude:(id)a11 isEnabled:(BOOL)a12
{
  v18 = (void *)MEMORY[0x263F08C38];
  id v19 = a11;
  id v20 = a10;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  v30 = objc_msgSend_UUID(v18, v27, v28, v29);
  isEnabled = (NCWaypoint *)objc_msgSend_initWithUUID_label_shortLabel_explanatoryDescription_color_highlightColor_symbol_type_location_altitude_isEnabled_(self, v31, (uint64_t)v30, (uint64_t)v26, v25, v24, v23, v22, v21, a9, v20, v19, a12);

  return isEnabled;
}

- (NCWaypoint)initWithUUID:(id)a3 label:(id)a4 shortLabel:(id)a5 explanatoryDescription:(id)a6 color:(id)a7 highlightColor:(id)a8 symbol:(id)a9 type:(int64_t)a10 location:(id)a11 altitude:(id)a12 isEnabled:(BOOL)a13
{
  v18 = (void *)MEMORY[0x263EFF910];
  id v19 = a12;
  id v20 = a11;
  id v21 = a9;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  v30 = objc_msgSend_date(v18, v27, v28, v29);
  isEnabled = (NCWaypoint *)objc_msgSend_initWithUUID_creationTime_label_shortLabel_explanatoryDescription_color_highlightColor_symbol_type_location_altitude_isEnabled_(self, v31, (uint64_t)v26, (uint64_t)v30, v25, v24, v23, v22, 0, v21, a10, v20, v19, a13);

  return isEnabled;
}

- (NCWaypoint)initWithUUID:(id)a3 creationTime:(id)a4 label:(id)a5 shortLabel:(id)a6 explanatoryDescription:(id)a7 color:(id)a8 highlightColor:(id)a9 symbol:(id)a10 type:(int64_t)a11 location:(id)a12 altitude:(id)a13 isEnabled:(BOOL)a14
{
  id v40 = a3;
  id obj = a4;
  id v39 = a4;
  id v34 = a5;
  id v38 = a5;
  id v35 = a6;
  id v20 = a6;
  id v36 = a7;
  id v21 = a7;
  id v41 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a12;
  id v25 = a13;
  v42.receiver = self;
  v42.super_class = (Class)NCWaypoint;
  id v26 = [(NCWaypoint *)&v42 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_uuid, a3);
    objc_storeStrong((id *)&v27->_timestampOfCreation, obj);
    v27->_enabled = a14;
    objc_storeStrong((id *)&v27->_label, v34);
    objc_storeStrong((id *)&v27->_shortLabel, v35);
    objc_storeStrong((id *)&v27->_explanatoryDescription, v36);
    objc_storeStrong((id *)&v27->_labelColor, a8);
    objc_storeStrong((id *)&v27->_highlightColor, a9);
    objc_storeStrong((id *)&v27->_symbol, a10);
    v27->_type = a11;
    objc_storeStrong((id *)&v27->_location, a12);
    if (v25)
    {
      objc_msgSend_doubleValue(v25, v28, v29, v30);
      v27->_altitude = v31;
      v27->_altitudePopulated = 1;
    }
  }

  return v27;
}

- (id)description
{
  labelColorDescription = self->_labelColorDescription;
  if (!labelColorDescription)
  {
    labelColor = self->_labelColor;
    if (!labelColor) {
      goto LABEL_6;
    }
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    if (objc_msgSend_getRed_green_blue_alpha_(labelColor, a2, (uint64_t)&v16, (uint64_t)&v15, &v14, &v13))
    {
      objc_msgSend_stringWithFormat_(NSString, a2, @"(R:%.2f,G:%.2f,B:%.2f,a:%.2f)", v2, v16, v15, v14, v13);
      uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = self->_labelColorDescription;
      self->_labelColorDescription = v6;
    }
    labelColorDescription = self->_labelColorDescription;
    if (!labelColorDescription)
    {
LABEL_6:
      uint64_t v8 = self->_labelColorDescription;
      self->_labelColorDescription = (NSString *)@"nil";

      labelColorDescription = self->_labelColorDescription;
    }
  }
  uuid = self->_uuid;
  symbol = self->_symbol;
  if (self->_enabled) {
    objc_msgSend_stringWithFormat_(NSString, a2, @"<NCWaypoint:%@:%@:%@:%@>", v2, uuid, symbol, labelColorDescription, @"Enabled");
  }
  else {
  uint64_t v11 = objc_msgSend_stringWithFormat_(NSString, a2, @"<NCWaypoint:%@:%@:%@:%@>", v2, uuid, symbol, labelColorDescription, @"Disabled");
  }

  return v11;
}

- (BOOL)isConnectivityWaypoint
{
  return ((objc_msgSend_type(self, a2, v2, v3) - 3) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)isParkedCarWaypoint
{
  return objc_msgSend_type(self, a2, v2, v3) == 1;
}

- (BOOL)isSystemWaypoint
{
  if (objc_msgSend_isConnectivityWaypoint(self, a2, v2, v3)) {
    return 1;
  }

  return MEMORY[0x270F9A6D0](self, sel_isParkedCarWaypoint, v5, v6);
}

- (NSString)symbol
{
  return (NSString *)((uint64_t (*)(__objc2_class *, char *, NSString *))MEMORY[0x270F9A6D0])(_TtC24NanoCompassComplications16NCWaypointGlyphs, sel_convertedSymbolFrom_, self->_symbol);
}

- (void)setLabelColor:(id)a3
{
  id v8 = a3;
  if ((objc_msgSend_isEqual_(self->_labelColor, v5, (uint64_t)v8, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_labelColor, a3);
    labelColorDescription = self->_labelColorDescription;
    self->_labelColorDescription = 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (objc_msgSend_isAltitudePopulated(self, a2, (uint64_t)a3, v3))
  {
    id v8 = NSNumber;
    objc_msgSend_altitude(self, v5, v6, v7);
    v56 = objc_msgSend_numberWithDouble_(v8, v9, v10, v11);
  }
  else
  {
    v56 = 0;
  }
  v55 = [NCWaypoint alloc];
  uint64_t v15 = objc_msgSend_uuid(self, v12, v13, v14);
  id v19 = objc_msgSend_timestampOfCreation(self, v16, v17, v18);
  id v23 = objc_msgSend_label(self, v20, v21, v22);
  v27 = objc_msgSend_shortLabel(self, v24, v25, v26);
  double v31 = objc_msgSend_explanatoryDescription(self, v28, v29, v30);
  id v35 = objc_msgSend_labelColor(self, v32, v33, v34);
  id v39 = objc_msgSend_symbol(self, v36, v37, v38);
  uint64_t v43 = objc_msgSend_type(self, v40, v41, v42);
  v47 = objc_msgSend_location(self, v44, v45, v46);
  char isEnabled = objc_msgSend_isEnabled(self, v48, v49, v50);
  v52 = objc_msgSend_initWithUUID_creationTime_label_shortLabel_explanatoryDescription_color_highlightColor_symbol_type_location_altitude_isEnabled_(v55, v51, (uint64_t)v15, (uint64_t)v19, v23, v27, v31, v35, 0, v39, v43, v47, v56, isEnabled);

  return v52;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NCWaypoint)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend_decodeDoubleForKey_(v4, v5, @"latitude", v6);
  double v8 = v7;
  objc_msgSend_decodeDoubleForKey_(v4, v9, @"longitude", v10);
  double v12 = v11;
  id v13 = objc_alloc(MEMORY[0x263F00A50]);
  uint64_t v17 = objc_msgSend_initWithLatitude_longitude_(v13, v14, v15, v16, v8, v12);
  if (objc_msgSend_decodeBoolForKey_(v4, v18, @"altitudePopulated", v19))
  {
    uint64_t v22 = NSNumber;
    objc_msgSend_decodeDoubleForKey_(v4, v20, @"altitude", v21);
    uint64_t v26 = objc_msgSend_numberWithDouble_(v22, v23, v24, v25);
  }
  else
  {
    uint64_t v26 = 0;
  }
  uint64_t v27 = objc_opt_class();
  uint64_t v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, @"uuid");
  uint64_t v30 = objc_opt_class();
  v32 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, @"creationTimestamp");
  uint64_t v33 = objc_opt_class();
  id v35 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, @"label");
  uint64_t v36 = objc_opt_class();
  uint64_t v38 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v37, v36, @"labelColor");
  uint64_t v39 = objc_opt_class();
  uint64_t v41 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, @"symbol");
  uint64_t v44 = objc_msgSend_decodeIntegerForKey_(v4, v42, @"type", v43);
  char v50 = objc_msgSend_decodeBoolForKey_(v4, v45, @"enabled", v46);
  char isEnabled = (NCWaypoint *)objc_msgSend_initWithUUID_creationTime_label_shortLabel_explanatoryDescription_color_highlightColor_symbol_type_location_altitude_isEnabled_(self, v47, (uint64_t)v29, (uint64_t)v32, v35, 0, 0, v38, 0, v41, v44, v17, v26, v50);

  return isEnabled;
}

- (void)encodeWithCoder:(id)a3
{
  label = self->_label;
  id v26 = a3;
  objc_msgSend_encodeObject_forKey_(v26, v5, (uint64_t)label, @"label");
  objc_msgSend_coordinate(self->_location, v6, v7, v8);
  objc_msgSend_encodeDouble_forKey_(v26, v9, @"latitude", v10);
  objc_msgSend_coordinate(self->_location, v11, v12, v13);
  objc_msgSend_encodeDouble_forKey_(v26, v14, @"longitude", v15, v16);
  objc_msgSend_encodeObject_forKey_(v26, v17, (uint64_t)self->_labelColor, @"labelColor");
  objc_msgSend_encodeObject_forKey_(v26, v18, (uint64_t)self->_symbol, @"symbol");
  objc_msgSend_encodeBool_forKey_(v26, v19, self->_enabled, @"enabled");
  objc_msgSend_encodeObject_forKey_(v26, v20, (uint64_t)self->_timestampOfCreation, @"creationTimestamp");
  objc_msgSend_encodeObject_forKey_(v26, v21, (uint64_t)self->_uuid, @"uuid");
  objc_msgSend_encodeDouble_forKey_(v26, v22, @"altitude", v23, self->_altitude);
  objc_msgSend_encodeBool_forKey_(v26, v24, self->_altitudePopulated, @"altitudePopulated");
  objc_msgSend_encodeInteger_forKey_(v26, v25, self->_type, @"type");
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (void)setSymbol:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSDate)timestampOfCreation
{
  return self->_timestampOfCreation;
}

- (void)setTimestampOfCreation:(id)a3
{
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (BOOL)isAltitudePopulated
{
  return self->_altitudePopulated;
}

- (void)setAltitudePopulated:(BOOL)a3
{
  self->_altitudePopulated = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)shortLabel
{
  return self->_shortLabel;
}

- (void)setShortLabel:(id)a3
{
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (NSString)explanatoryDescription
{
  return self->_explanatoryDescription;
}

- (NSUUID)guideUUID
{
  return self->_guideUUID;
}

- (void)setGuideUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanatoryDescription, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_shortLabel, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_timestampOfCreation, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_guideUUID, 0);

  objc_storeStrong((id *)&self->_labelColorDescription, 0);
}

- (BOOL)isEquivalentCellularWaypoint:(id)a3
{
  uint64_t v7 = (NCWaypoint *)a3;
  if (self == v7)
  {
    char v16 = 1;
  }
  else
  {
    uint64_t v8 = objc_msgSend_type(self, v4, v5, v6);
    if (v8 == objc_msgSend_type(v7, v9, v10, v11)) {
      char isConnectivityWaypoint = objc_msgSend_isConnectivityWaypoint(self, v12, v13, v14);
    }
    else {
      char isConnectivityWaypoint = 0;
    }
    uint64_t v17 = objc_msgSend_location(self, v12, v13, v14);
    objc_msgSend_coordinate(v17, v18, v19, v20);
    double v22 = v21;
    double v24 = v23;

    uint64_t v28 = objc_msgSend_location(v7, v25, v26, v27);
    objc_msgSend_coordinate(v28, v29, v30, v31);
    double v33 = v32;
    double v35 = v34;

    uint64_t v39 = objc_msgSend_labelColor(self, v36, v37, v38);
    uint64_t v43 = objc_msgSend_labelColor(v7, v40, v41, v42);
    if (objc_msgSend_isEqual_(v39, v44, (uint64_t)v43, v45))
    {
      uint64_t v49 = objc_msgSend_highlightColor(self, v46, v47, v48);
      v53 = objc_msgSend_highlightColor(v7, v50, v51, v52);
      char isEqual = objc_msgSend_isEqual_(v49, v54, (uint64_t)v53, v55);
    }
    else
    {
      char isEqual = 0;
    }

    if (v22 == v33) {
      char v57 = isConnectivityWaypoint;
    }
    else {
      char v57 = 0;
    }
    if (v24 != v35) {
      char v57 = 0;
    }
    char v16 = v57 & isEqual;
  }

  return v16;
}

+ (id)waypointForDescriptorWithUUID:(id)a3 creationTime:(id)a4 label:(id)a5 color:(id)a6 symbol:(id)a7 location:(id)a8 isEnabled:(BOOL)a9
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = objc_alloc((Class)a1);
  char isEnabled = objc_msgSend_initWithUUID_creationTime_label_shortLabel_explanatoryDescription_color_highlightColor_symbol_type_location_altitude_isEnabled_(v21, v22, (uint64_t)v20, (uint64_t)v19, v18, 0, 0, v17, 0, v16, 4, v15, 0, a9);

  return isEnabled;
}

+ (id)waypointForCoreDataWaypoint:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_altitudePopulated(v4, v5, v6, v7))
  {
    uint64_t v11 = NSNumber;
    objc_msgSend_altitude(v4, v8, v9, v10);
    id v15 = objc_msgSend_numberWithDouble_(v11, v12, v13, v14);
  }
  else
  {
    id v15 = 0;
  }
  id v16 = objc_alloc((Class)a1);
  id v20 = objc_msgSend_uuid(v4, v17, v18, v19);
  double v24 = objc_msgSend_timeOfCreation(v4, v21, v22, v23);
  uint64_t v28 = objc_msgSend_label(v4, v25, v26, v27);
  double v32 = objc_msgSend_labelColor(v4, v29, v30, v31);
  uint64_t v36 = objc_msgSend_symbol(v4, v33, v34, v35);
  uint64_t v40 = (int)objc_msgSend_type(v4, v37, v38, v39);
  uint64_t v44 = objc_msgSend_coreLocation(v4, v41, v42, v43);
  char v51 = objc_msgSend_enabled(v4, v45, v46, v47);
  char isEnabled = objc_msgSend_initWithUUID_creationTime_label_shortLabel_explanatoryDescription_color_highlightColor_symbol_type_location_altitude_isEnabled_(v16, v48, (uint64_t)v20, (uint64_t)v24, v28, 0, 0, v32, 0, v36, v40, v44, v15, v51);

  return isEnabled;
}

+ (id)waypointForCollectionPlaceItem:(id)a3 inGuide:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x263F00A50];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  uint64_t v13 = objc_msgSend_latitude(v8, v10, v11, v12);
  objc_msgSend_doubleValue(v13, v14, v15, v16);
  double v18 = v17;
  uint64_t v22 = objc_msgSend_longitude(v8, v19, v20, v21);
  objc_msgSend_doubleValue(v22, v23, v24, v25);
  uint64_t v30 = objc_msgSend_initWithLatitude_longitude_(v9, v26, v27, v28, v18, v29);

  id v31 = objc_alloc((Class)a1);
  uint64_t v35 = objc_msgSend_identifier(v8, v32, v33, v34);
  uint64_t v39 = objc_msgSend_createTime(v8, v36, v37, v38);
  uint64_t v43 = objc_msgSend_customName(v8, v40, v41, v42);

  uint64_t v47 = objc_msgSend_defaultMapGuideWaypointIconColor(NCWaypoint, v44, v45, v46);
  char v53 = 1;
  char isEnabled = objc_msgSend_initWithUUID_creationTime_label_shortLabel_explanatoryDescription_color_highlightColor_symbol_type_location_altitude_isEnabled_(v31, v48, (uint64_t)v35, (uint64_t)v39, v43, 0, 0, v47, 0, @"mappin", 2, v30, 0, v53);

  objc_msgSend_setGuideUUID_(isEnabled, v50, (uint64_t)v7, v51);

  return isEnabled;
}

+ (id)guideWaypointInDbWithUUID:(id)a3 altitude:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x263F00A50];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  uint64_t v13 = objc_msgSend_initWithLatitude_longitude_(v9, v10, v11, v12, -1.0, -1.0);
  id v14 = objc_alloc((Class)a1);
  double v18 = objc_msgSend_now(MEMORY[0x263EFF910], v15, v16, v17);
  uint64_t v22 = objc_msgSend_defaultMapGuideWaypointIconColor(NCWaypoint, v19, v20, v21);
  uint64_t v26 = objc_msgSend_defaultMapGuideWaypointIconColor(NCWaypoint, v23, v24, v25);
  char v30 = 1;
  char isEnabled = objc_msgSend_initWithUUID_creationTime_label_shortLabel_explanatoryDescription_color_highlightColor_symbol_type_location_altitude_isEnabled_(v14, v27, (uint64_t)v8, (uint64_t)v18, @"Placeholder", @"Placeholder", 0, v22, v26, @"mappin", 2, v13, v7, v30);

  return isEnabled;
}

@end