@interface MPRadioRecentStationsGroup
+ (BOOL)supportsSecureCoding;
- (MPRadioRecentStationsGroup)initWithCoder:(id)a3;
- (NSArray)stations;
- (NSString)localizedTitle;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setStations:(id)a3;
@end

@implementation MPRadioRecentStationsGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stations, 0);

  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (void)setStations:(id)a3
{
}

- (NSArray)stations
{
  return self->_stations;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (MPRadioRecentStationsGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MPRadioRecentStationsGroup *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MPRadioRecentStationsGroupStations"];
    stations = v5->_stations;
    v5->_stations = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPRadioRecentStationsGroupLocalizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  localizedTitle = self->_localizedTitle;
  id v5 = a3;
  [v5 encodeObject:localizedTitle forKey:@"MPRadioRecentStationsGroupLocalizedTitle"];
  [v5 encodeObject:self->_stations forKey:@"MPRadioRecentStationsGroupStations"];
}

@end