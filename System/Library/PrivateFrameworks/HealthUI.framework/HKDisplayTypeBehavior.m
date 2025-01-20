@interface HKDisplayTypeBehavior
- (BOOL)allowsSourceReordering;
- (BOOL)appearsInDataTypeSearch;
- (BOOL)canBecomeFavorite;
- (BOOL)chartsRelativeData;
- (BOOL)hidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsAssociatedSamples;
- (BOOL)unitPreferencesRequireChangeConfirmation;
- (HKDisplayTypeBehavior)init;
- (HKDisplayTypeBehavior)initWithStatisticsMergeStrategy:(unint64_t)a3 preferredCalendaryDayAlignment:(int64_t)a4 allowsSourceReordering:(BOOL)a5 unitPreferenceChangeConfirmation:(BOOL)a6 chartsRelativeData:(BOOL)a7 appearsInDataTypeSearch:(BOOL)a8 supportsAssociatedSamples:(BOOL)a9 canBecomeFavorite:(BOOL)a10 hidden:(BOOL)a11;
- (id)description;
- (int64_t)preferredCalendarDayAlignment;
- (unint64_t)hash;
- (unint64_t)statisticsMergeStrategy;
@end

@implementation HKDisplayTypeBehavior

- (HKDisplayTypeBehavior)initWithStatisticsMergeStrategy:(unint64_t)a3 preferredCalendaryDayAlignment:(int64_t)a4 allowsSourceReordering:(BOOL)a5 unitPreferenceChangeConfirmation:(BOOL)a6 chartsRelativeData:(BOOL)a7 appearsInDataTypeSearch:(BOOL)a8 supportsAssociatedSamples:(BOOL)a9 canBecomeFavorite:(BOOL)a10 hidden:(BOOL)a11
{
  v18.receiver = self;
  v18.super_class = (Class)HKDisplayTypeBehavior;
  result = [(HKDisplayTypeBehavior *)&v18 init];
  if (result)
  {
    result->_statisticsMergeStrategy = a3;
    result->_preferredCalendarDayAlignment = a4;
    result->_allowsSourceReordering = a5;
    result->_unitPreferencesRequireChangeConfirmation = a6;
    result->_chartsRelativeData = a7;
    result->_appearsInDataTypeSearch = a8;
    result->_supportsAssociatedSamples = a9;
    result->_canBecomeFavorite = a10;
    result->_hidden = a11;
  }
  return result;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (int64_t)preferredCalendarDayAlignment
{
  return self->_preferredCalendarDayAlignment;
}

- (HKDisplayTypeBehavior)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)description
{
  v2 = "All";
  if (!self->_statisticsMergeStrategy) {
    v2 = "Best";
  }
  v3 = "Natural";
  if (self->_preferredCalendarDayAlignment) {
    v3 = "Sleep";
  }
  uint64_t v4 = "YES";
  if (self->_allowsSourceReordering) {
    v5 = "YES";
  }
  else {
    v5 = "no";
  }
  if (self->_unitPreferencesRequireChangeConfirmation) {
    v6 = "Confirmation";
  }
  else {
    v6 = "Simple";
  }
  if (self->_chartsRelativeData) {
    v7 = "Relative";
  }
  else {
    v7 = "Absolute";
  }
  if (self->_appearsInDataTypeSearch) {
    v8 = "YES";
  }
  else {
    v8 = "no";
  }
  if (self->_supportsAssociatedSamples) {
    v9 = "YES";
  }
  else {
    v9 = "no";
  }
  if (!self->_canBecomeFavorite) {
    uint64_t v4 = "no";
  }
  if (self->_hidden) {
    v10 = " HIDDEN";
  }
  else {
    v10 = "";
  }
  return (id)[NSString stringWithFormat:@"<HKDisplayTypeBehavior: Statistics: %s, Day: %s, Source reorderable: %s, Unit change: %s, Chart: %s, Search: %s, Associated Samples: %s, Favoritable: %s%s>", v2, v3, v5, v6, v7, v8, v9, v4, v10];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_statisticsMergeStrategy == v4[2]
    && self->_preferredCalendarDayAlignment == v4[3]
    && self->_allowsSourceReordering == *((unsigned __int8 *)v4 + 8)
    && self->_unitPreferencesRequireChangeConfirmation == *((unsigned __int8 *)v4 + 9)
    && self->_chartsRelativeData == *((unsigned __int8 *)v4 + 10)
    && self->_appearsInDataTypeSearch == *((unsigned __int8 *)v4 + 11)
    && self->_supportsAssociatedSamples == *((unsigned __int8 *)v4 + 12)
    && self->_canBecomeFavorite == *((unsigned __int8 *)v4 + 13)
    && self->_hidden == *((unsigned __int8 *)v4 + 14);

  return v5;
}

- (unint64_t)hash
{
  v2.i32[0] = *(_DWORD *)&self->_allowsSourceReordering;
  int8x16_t v3 = (int8x16_t)vmovl_u16(vshl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v2), (uint16x4_t)0x4000300020001));
  v4.i64[0] = 255;
  v4.i64[1] = 255;
  *(int8x8_t *)v3.i8 = veor_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
  v5.i64[0] = v3.u32[0];
  v5.i64[1] = v3.u32[1];
  int8x16_t v6 = vandq_s8(v5, v4);
  return *(void *)&veor_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) ^ (32
                                                                                                * self->_supportsAssociatedSamples) ^ (((unint64_t)self->_canBecomeFavorite << 6) | ((unint64_t)self->_hidden << 7)) ^ self->_statisticsMergeStrategy ^ self->_preferredCalendarDayAlignment;
}

- (unint64_t)statisticsMergeStrategy
{
  return self->_statisticsMergeStrategy;
}

- (BOOL)allowsSourceReordering
{
  return self->_allowsSourceReordering;
}

- (BOOL)unitPreferencesRequireChangeConfirmation
{
  return self->_unitPreferencesRequireChangeConfirmation;
}

- (BOOL)chartsRelativeData
{
  return self->_chartsRelativeData;
}

- (BOOL)appearsInDataTypeSearch
{
  return self->_appearsInDataTypeSearch;
}

- (BOOL)supportsAssociatedSamples
{
  return self->_supportsAssociatedSamples;
}

- (BOOL)canBecomeFavorite
{
  return self->_canBecomeFavorite;
}

@end