@interface CLIndoorLocation
+ (BOOL)supportsSecureCoding;
- ($146E4FC062DDF4A2C58C04BCAEC0B25D)diagnosticReport;
- ($8346F60F14D5FFA78589B066C3F3C2F8)locationPrivate;
- ($FC467A9753EF35A59AAA53554404748C)location;
- (BOOL)requestsGpsAssistance;
- (CLIndoorLocation)initWithCoder:(id)a3;
- (NSString)locationDescription;
- (NSString)locationId;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDiagnosticReport:(id *)a3;
- (void)setLocation:(id *)a3;
- (void)setLocationDescription:(id)a3;
- (void)setLocationId:(id)a3;
- (void)setLocationPrivate:(id *)a3;
- (void)setRequestsGpsAssistance:(BOOL)a3;
@end

@implementation CLIndoorLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLIndoorLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CLIndoorLocation;
  v5 = [(CLIndoorLocation *)&v32 init];
  if (v5)
  {
    sub_221E36CC8(v4, (char *)v31);
    long long v6 = v31[3];
    *(_OWORD *)(v5 + 200) = v31[2];
    *(_OWORD *)(v5 + 216) = v6;
    long long v7 = v31[5];
    *(_OWORD *)(v5 + 232) = v31[4];
    *(_OWORD *)(v5 + 248) = v7;
    long long v8 = v31[1];
    *(_OWORD *)(v5 + 168) = v31[0];
    *(_OWORD *)(v5 + 184) = v8;
    long long v9 = v31[7];
    *(_OWORD *)(v5 + 264) = v31[6];
    *(_OWORD *)(v5 + 280) = v9;
    *(_OWORD *)(v5 + 296) = v31[8];
    *(_OWORD *)(v5 + 308) = *(_OWORD *)((char *)&v31[8] + 12);
    sub_221E36D70(v4, (char *)v31);
    memcpy(v5 + 328, v31, 0x230uLL);
    uint64_t v10 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"locationId", v12);
    v14 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"locationDescription", v17);
    v19 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v18;

    v5[8] = objc_msgSend_decodeBoolForKey_(v4, v20, @"gpsAssistance", v21, v22);
    sub_221E36E18(v4, (char *)v31);
    uint64_t v23 = *(void *)&v31[8];
    long long v24 = v31[7];
    *((_OWORD *)v5 + 8) = v31[6];
    *((_OWORD *)v5 + 9) = v24;
    *((void *)v5 + 20) = v23;
    long long v26 = v31[4];
    long long v25 = v31[5];
    long long v27 = v31[3];
    *((_OWORD *)v5 + 4) = v31[2];
    *((_OWORD *)v5 + 5) = v27;
    *((_OWORD *)v5 + 6) = v26;
    *((_OWORD *)v5 + 7) = v25;
    long long v28 = v31[1];
    *((_OWORD *)v5 + 2) = v31[0];
    *((_OWORD *)v5 + 3) = v28;
    v29 = v5;
  }

  return (CLIndoorLocation *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  sub_221E36D5C((uint64_t)v10, (uint64_t)&self->_location);
  sub_221E36E04((uint64_t)v10, (uint64_t)&self->_location.ellipsoidalAltitude);
  objc_msgSend_encodeObject_forKey_(v10, v4, (uint64_t)self->_locationId, @"locationId", v5);
  objc_msgSend_encodeObject_forKey_(v10, v6, (uint64_t)self->_locationDescription, @"locationDescription", v7);
  objc_msgSend_encodeBool_forKey_(v10, v8, self->_requestsGpsAssistance, @"gpsAssistance", v9);
  sub_221E36EAC((uint64_t)v10, (uint64_t)&self->_diagnosticReport);
}

- (id)description
{
  objc_msgSend_location(self, a2, v2, v3, v4);
  long long v6 = NSString;
  objc_msgSend_location(self, v7, v8, v9, v10);
  objc_msgSend_location(self, v11, v12, v13, v14);
  v19 = objc_msgSend_locationId(self, v15, v16, v17, v18);
  long long v24 = objc_msgSend_locationDescription(self, v20, v21, v22, v23);
  objc_msgSend_location(self, v25, v26, v27, v28);
  int v33 = objc_msgSend_requestsGpsAssistance(self, v29, v30, v31, v32);
  objc_msgSend_location(self, v34, v35, v36, v37);
  if (v33) {
    objc_msgSend_stringWithFormat_(v6, v38, @"lat/lon=[%lf, %lf] on floor %d (%@: %@) +/- %lf meters (gps assistance = %s) with location type %d", v39, v40, v46, v45, v47, v19, v24, v44, "yes", v43);
  }
  else {
  v41 = objc_msgSend_stringWithFormat_(v6, v38, @"lat/lon=[%lf, %lf] on floor %d (%@: %@) +/- %lf meters (gps assistance = %s) with location type %d", v39, v40, v46, v45, v47, v19, v24, v44, "no", v43);
  }

  return v41;
}

- ($FC467A9753EF35A59AAA53554404748C)location
{
  long long v3 = *(_OWORD *)&self[1].var4;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&self[1].var2;
  *(_OWORD *)&retstr->var5 = v3;
  long long v4 = *(_OWORD *)&self[1].var8;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&self[1].var6;
  *(_OWORD *)&retstr->var9 = v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 var1 = self[1].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var21;
  *($F24F406B2B787EFB06265DBA3D28CBD5 *)&retstr->var1.$F24F406B2B787EFB06265DBA3D28CBD5 var1 = var1;
  $F24F406B2B787EFB06265DBA3D28CBD5 v6 = *($F24F406B2B787EFB06265DBA3D28CBD5 *)&self[1].var12;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&self[1].var10;
  retstr->var13 = v6;
  *(_OWORD *)&retstr->var14 = *(_OWORD *)&self[1].var13.var1;
  *(_OWORD *)&retstr->var16 = *(_OWORD *)((char *)&self[1].var14 + 4);
  return self;
}

- (void)setLocation:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_location.coordinate.longitude = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_location.suitability = v3;
  long long v4 = *(_OWORD *)&a3->var3;
  long long v5 = *(_OWORD *)&a3->var5;
  long long v6 = *(_OWORD *)&a3->var7;
  *(_OWORD *)&self->_location.timestamp = *(_OWORD *)&a3->var9;
  *(_OWORD *)&self->_location.course = v6;
  *(_OWORD *)&self->_location.speed = v5;
  *(_OWORD *)&self->_location.altitude = v4;
  long long v7 = *(_OWORD *)&a3->var11;
  $AB5116BA7E623E054F959CECB034F4E7 var13 = ($AB5116BA7E623E054F959CECB034F4E7)a3->var13;
  long long v9 = *(_OWORD *)&a3->var14;
  *(_OWORD *)&self->_location.integrity = *(_OWORD *)&a3->var16;
  self->_location.rawCoordinate = var13;
  *(_OWORD *)&self->_location.rawCourse = v9;
  *(_OWORD *)&self->_location.lifespan = v7;
}

- ($8346F60F14D5FFA78589B066C3F3C2F8)locationPrivate
{
  return ($8346F60F14D5FFA78589B066C3F3C2F8 *)memcpy(retstr, &self->_location.ellipsoidalAltitude, sizeof($8346F60F14D5FFA78589B066C3F3C2F8));
}

- (void)setLocationPrivate:(id *)a3
{
}

- (NSString)locationId
{
  return self->_locationId;
}

- (void)setLocationId:(id)a3
{
}

- (NSString)locationDescription
{
  return self->_locationDescription;
}

- (void)setLocationDescription:(id)a3
{
}

- (BOOL)requestsGpsAssistance
{
  return self->_requestsGpsAssistance;
}

- (void)setRequestsGpsAssistance:(BOOL)a3
{
  self->_requestsGpsAssistance = a3;
}

- ($146E4FC062DDF4A2C58C04BCAEC0B25D)diagnosticReport
{
  long long v3 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var8 = *(_OWORD *)&self->var12;
  *(_OWORD *)&retstr->var10 = v3;
  *(double *)&retstr->var12 = self[1].var3;
  long long v4 = *(_OWORD *)&self->var7[3];
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->var7[1];
  *(_OWORD *)&retstr->var6 = v4;
  long long v5 = *(_OWORD *)&self->var10;
  *(_OWORD *)&retstr->var7[1] = *(_OWORD *)&self->var8;
  *(_OWORD *)&retstr->var7[3] = v5;
  long long v6 = *(_OWORD *)&self->var6;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var2 = v6;
  return self;
}

- (void)setDiagnosticReport:(id *)a3
{
  *(_OWORD *)&self->_diagnosticReport.yieldType = *(_OWORD *)&a3->var0;
  long long v3 = *(_OWORD *)&a3->var2;
  long long v4 = *(_OWORD *)&a3->var4;
  long long v5 = *(_OWORD *)&a3->var7[1];
  *(_OWORD *)&self->_diagnosticReport.prbOnFloors = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_diagnosticReport.prbOnFloor[1] = v5;
  *(_OWORD *)&self->_diagnosticReport.prbCoarseIndoorSaysIndoor = v3;
  *(_OWORD *)&self->_diagnosticReport.prbGpsSaysIndoor = v4;
  long long v6 = *(_OWORD *)&a3->var7[3];
  long long v7 = *(_OWORD *)&a3->var8;
  long long v8 = *(_OWORD *)&a3->var10;
  *(void *)&self->_diagnosticReport.pfYieldStatusBeforeCalculatePose = *(void *)&a3->var12;
  *(_OWORD *)&self->_diagnosticReport.prbInlier = v7;
  *(_OWORD *)&self->_diagnosticReport.prbInjectionOccupancyRetryLimitOk = v8;
  *(_OWORD *)&self->_diagnosticReport.prbOnFloor[3] = v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationDescription, 0);
  objc_storeStrong((id *)&self->_locationId, 0);
}

@end