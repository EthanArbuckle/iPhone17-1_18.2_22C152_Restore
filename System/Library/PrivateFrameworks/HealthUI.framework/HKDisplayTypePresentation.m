@interface HKDisplayTypePresentation
- (BOOL)isCriticalForAutoscale;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldDisplayUnitStringOnYAxis;
- (BOOL)showAllDataHierarchically;
- (BOOL)showAppDataHierarchically;
- (BOOL)useSecondsWhenDisplayingDuration;
- (HKDisplayTypePresentation)init;
- (HKDisplayTypePresentation)initWithDefaultConfiguration:(id)a3 configurationOverrides:(id)a4 scaleFactor:(double)a5 showAllDataHierarchically:(BOOL)a6 showAppDataHierarchically:(BOOL)a7 shouldDisplayUnitStringOnYAxis:(BOOL)a8 useSecondsWhenDisplayingDuration:(BOOL)a9 isCriticalForAutoscale:(BOOL)a10 detailImageName:(id)a11 listIconImageNameOverride:(id)a12 summaryAttribution:(id)a13;
- (HKDisplayTypeSummaryAttribution)summaryAttribution;
- (NSString)detailImageName;
- (NSString)listIconImageNameOverride;
- (double)adjustedDoubleForClientDouble:(double)a3;
- (double)adjustedDoubleForDaemonDouble:(double)a3;
- (double)scaleFactor;
- (id)adjustedValueForClientValue:(id)a3;
- (id)adjustedValueForDaemonValue:(id)a3;
- (id)configurationForTimeScope:(int64_t)a3;
- (id)copyWithIsCriticalForAutoscale:(BOOL)a3;
- (id)copyWithListIconImageNameOverride:(id)a3;
- (unint64_t)hash;
@end

@implementation HKDisplayTypePresentation

- (HKDisplayTypePresentation)initWithDefaultConfiguration:(id)a3 configurationOverrides:(id)a4 scaleFactor:(double)a5 showAllDataHierarchically:(BOOL)a6 showAppDataHierarchically:(BOOL)a7 shouldDisplayUnitStringOnYAxis:(BOOL)a8 useSecondsWhenDisplayingDuration:(BOOL)a9 isCriticalForAutoscale:(BOOL)a10 detailImageName:(id)a11 listIconImageNameOverride:(id)a12 summaryAttribution:(id)a13
{
  id v36 = a3;
  id v20 = a4;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  v37.receiver = self;
  v37.super_class = (Class)HKDisplayTypePresentation;
  v24 = [(HKDisplayTypePresentation *)&v37 init];
  if (v24)
  {
    uint64_t v25 = [v36 copy];
    defaultConfiguration = v24->_defaultConfiguration;
    v24->_defaultConfiguration = (HKDisplayTypePresentationConfiguration *)v25;

    uint64_t v27 = [v20 copy];
    configurationOverrides = v24->_configurationOverrides;
    v24->_configurationOverrides = (NSDictionary *)v27;

    v24->_scaleFactor = a5;
    v24->_showAllDataHierarchically = a6;
    v24->_showAppDataHierarchically = a7;
    v24->_shouldDisplayUnitStringOnYAxis = a8;
    v24->_useSecondsWhenDisplayingDuration = a9;
    v24->_isCriticalForAutoscale = a10;
    uint64_t v29 = [v21 copy];
    detailImageName = v24->_detailImageName;
    v24->_detailImageName = (NSString *)v29;

    uint64_t v31 = [v22 copy];
    listIconImageNameOverride = v24->_listIconImageNameOverride;
    v24->_listIconImageNameOverride = (NSString *)v31;

    uint64_t v33 = [v23 copy];
    summaryAttribution = v24->_summaryAttribution;
    v24->_summaryAttribution = (HKDisplayTypeSummaryAttribution *)v33;
  }
  return v24;
}

- (BOOL)isCriticalForAutoscale
{
  return self->_isCriticalForAutoscale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryAttribution, 0);
  objc_storeStrong((id *)&self->_listIconImageNameOverride, 0);
  objc_storeStrong((id *)&self->_detailImageName, 0);
  objc_storeStrong((id *)&self->_configurationOverrides, 0);
  objc_storeStrong((id *)&self->_defaultConfiguration, 0);
}

- (HKDisplayTypePresentation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)configurationForTimeScope:(int64_t)a3
{
  configurationOverrides = self->_configurationOverrides;
  v5 = [NSNumber numberWithInteger:a3];
  v6 = [(NSDictionary *)configurationOverrides objectForKeyedSubscript:v5];

  defaultConfiguration = v6;
  if (!v6) {
    defaultConfiguration = self->_defaultConfiguration;
  }
  v8 = defaultConfiguration;

  return v8;
}

- (id)adjustedValueForDaemonValue:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (fabs(self->_scaleFactor + -1.0) >= 0.00000011920929)
    {
      [v4 doubleValue];
      id v6 = [NSNumber numberWithDouble:v8 * self->_scaleFactor];
    }
    else
    {
      id v6 = v4;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)adjustedValueForClientValue:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (fabs(self->_scaleFactor + -1.0) >= 0.00000011920929)
    {
      [v4 doubleValue];
      id v6 = [NSNumber numberWithDouble:v8 / self->_scaleFactor];
    }
    else
    {
      id v6 = v4;
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (double)adjustedDoubleForDaemonDouble:(double)a3
{
  double scaleFactor = self->_scaleFactor;
  if (fabs(scaleFactor + -1.0) < 0.00000011920929) {
    double scaleFactor = 1.0;
  }
  return scaleFactor * a3;
}

- (double)adjustedDoubleForClientDouble:(double)a3
{
  double scaleFactor = self->_scaleFactor;
  if (fabs(scaleFactor + -1.0) < 0.00000011920929) {
    double scaleFactor = 1.0;
  }
  return a3 / scaleFactor;
}

- (id)copyWithIsCriticalForAutoscale:(BOOL)a3
{
  LOBYTE(v4) = a3;
  return [[HKDisplayTypePresentation alloc] initWithDefaultConfiguration:self->_defaultConfiguration configurationOverrides:self->_configurationOverrides scaleFactor:self->_showAllDataHierarchically showAllDataHierarchically:self->_showAppDataHierarchically showAppDataHierarchically:self->_shouldDisplayUnitStringOnYAxis shouldDisplayUnitStringOnYAxis:self->_useSecondsWhenDisplayingDuration useSecondsWhenDisplayingDuration:self->_scaleFactor isCriticalForAutoscale:v4 detailImageName:self->_detailImageName listIconImageNameOverride:self->_listIconImageNameOverride summaryAttribution:self->_summaryAttribution];
}

- (id)copyWithListIconImageNameOverride:(id)a3
{
  id v4 = a3;
  v5 = [HKDisplayTypePresentation alloc];
  LOBYTE(v8) = self->_isCriticalForAutoscale;
  id v6 = [(HKDisplayTypePresentation *)v5 initWithDefaultConfiguration:self->_defaultConfiguration configurationOverrides:self->_configurationOverrides scaleFactor:self->_showAllDataHierarchically showAllDataHierarchically:self->_showAppDataHierarchically showAppDataHierarchically:self->_shouldDisplayUnitStringOnYAxis shouldDisplayUnitStringOnYAxis:self->_useSecondsWhenDisplayingDuration useSecondsWhenDisplayingDuration:self->_scaleFactor isCriticalForAutoscale:v8 detailImageName:self->_detailImageName listIconImageNameOverride:v4 summaryAttribution:self->_summaryAttribution];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKDisplayTypePresentationConfiguration *)self->_defaultConfiguration hash];
  uint64_t v4 = [(NSDictionary *)self->_configurationOverrides hash];
  double scaleFactor = self->_scaleFactor;
  uint64_t v6 = (uint64_t)scaleFactor;
  LODWORD(scaleFactor) = *(_DWORD *)&self->_showAllDataHierarchically;
  int8x16_t v16 = (int8x16_t)vmovl_u16(vshl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)&scaleFactor), (uint16x4_t)0x4000300020001));
  BOOL isCriticalForAutoscale = self->_isCriticalForAutoscale;
  NSUInteger v8 = [(NSString *)self->_detailImageName hash];
  NSUInteger v9 = [(NSString *)self->_listIconImageNameOverride hash];
  unint64_t v10 = [(HKDisplayTypeSummaryAttribution *)self->_summaryAttribution hash];
  int8x8_t v11 = veor_s8(*(int8x8_t *)v16.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v16, v16, 8uLL));
  v12.i64[0] = v11.u32[0];
  v12.i64[1] = v11.u32[1];
  v13.i64[0] = 255;
  v13.i64[1] = 255;
  int8x16_t v14 = vandq_s8(v12, v13);
  return *(void *)&veor_s8(*(int8x8_t *)v14.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v14, v14, 8uLL)) ^ (32 * isCriticalForAutoscale) ^ v10 ^ v9 ^ v8 ^ v4 ^ v3 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  if (![(HKDisplayTypePresentationConfiguration *)self->_defaultConfiguration isEqual:*((void *)v4 + 1)]) {
    goto LABEL_19;
  }
  if (![(NSDictionary *)self->_configurationOverrides isEqual:*((void *)v4 + 2)]) {
    goto LABEL_19;
  }
  if (vabdd_f64(self->_scaleFactor, *((double *)v4 + 4)) >= 0.00000011920929) {
    goto LABEL_19;
  }
  if (self->_showAllDataHierarchically != v4[24]) {
    goto LABEL_19;
  }
  if (self->_showAppDataHierarchically != v4[25]) {
    goto LABEL_19;
  }
  if (self->_shouldDisplayUnitStringOnYAxis != v4[26]) {
    goto LABEL_19;
  }
  if (self->_useSecondsWhenDisplayingDuration != v4[27]) {
    goto LABEL_19;
  }
  if (self->_isCriticalForAutoscale != v4[28]) {
    goto LABEL_19;
  }
  detailImageName = self->_detailImageName;
  uint64_t v6 = (NSString *)*((void *)v4 + 5);
  if (detailImageName != v6 && (!v6 || !-[NSString isEqualToString:](detailImageName, "isEqualToString:"))) {
    goto LABEL_19;
  }
  listIconImageNameOverride = self->_listIconImageNameOverride;
  NSUInteger v8 = (NSString *)*((void *)v4 + 6);
  if (listIconImageNameOverride != v8
    && (!v8 || !-[NSString isEqualToString:](listIconImageNameOverride, "isEqualToString:")))
  {
    goto LABEL_19;
  }
  summaryAttribution = self->_summaryAttribution;
  unint64_t v10 = (HKDisplayTypeSummaryAttribution *)*((void *)v4 + 7);
  if (summaryAttribution == v10)
  {
    char v11 = 1;
    goto LABEL_20;
  }
  if (v10) {
    char v11 = -[HKDisplayTypeSummaryAttribution isEqual:](summaryAttribution, "isEqual:");
  }
  else {
LABEL_19:
  }
    char v11 = 0;
LABEL_20:

  return v11;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (BOOL)showAllDataHierarchically
{
  return self->_showAllDataHierarchically;
}

- (BOOL)showAppDataHierarchically
{
  return self->_showAppDataHierarchically;
}

- (BOOL)shouldDisplayUnitStringOnYAxis
{
  return self->_shouldDisplayUnitStringOnYAxis;
}

- (BOOL)useSecondsWhenDisplayingDuration
{
  return self->_useSecondsWhenDisplayingDuration;
}

- (NSString)detailImageName
{
  return self->_detailImageName;
}

- (NSString)listIconImageNameOverride
{
  return self->_listIconImageNameOverride;
}

- (HKDisplayTypeSummaryAttribution)summaryAttribution
{
  return self->_summaryAttribution;
}

@end