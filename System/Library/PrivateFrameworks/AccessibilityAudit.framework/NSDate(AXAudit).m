@interface NSDate(AXAudit)
- (id)axAuditLogStringForDifferenceFromDate:()AXAudit;
@end

@implementation NSDate(AXAudit)

- (id)axAuditLogStringForDifferenceFromDate:()AXAudit
{
  v4 = (objc_class *)MEMORY[0x263EFF8F0];
  id v5 = a1;
  id v6 = a3;
  id v7 = [v4 alloc];
  v8 = (void *)[v7 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v9 = [v8 components:0x8000 fromDate:v6 toDate:v5 options:0];

  double v10 = (double)[v9 nanosecond] / 1000000000.0;
  v11 = &off_24726B000;
  LODWORD(v11) = vcvtmd_s64_f64(v10 / 86400.0);
  double v12 = (double)(86400 * (int)v11);
  if ((int)v11 <= 0) {
    double v12 = 0.0;
  }
  double v13 = v10 - v12;
  v14 = &off_24726B000;
  LODWORD(v14) = vcvtmd_s64_f64(v13 / 3600.0);
  double v15 = (double)(3600 * (int)v14);
  if ((int)v14 <= 0) {
    double v15 = 0.0;
  }
  double v16 = v13 - v15;
  uint64_t v17 = vcvtmd_s64_f64(v16 / 60.0) | 0x404E000000000000;
  uint64_t v18 = 60 * (int)v17;
  if ((int)v17 <= 0) {
    double v19 = v16;
  }
  else {
    double v19 = v16 - (double)v18;
  }
  if ((int)v11 < 1)
  {
    if ((int)v14 < 1)
    {
      if ((int)v17 < 1) {
        objc_msgSend(NSString, "stringWithFormat:", @"%02.4fs", *(void *)&v16, v22, v23, v24);
      }
      else {
        objc_msgSend(NSString, "stringWithFormat:", @"%02i:%02.3f", v17, v16 - (double)v18, v23, v24);
      }
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%02i:%02i:%02.3f", v14, v17, *(void *)&v19, v24);
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%02i:%02i:%02i:%02.3f", v11, v14, v17, *(void *)&v19);
  v20 = };

  return v20;
}

@end