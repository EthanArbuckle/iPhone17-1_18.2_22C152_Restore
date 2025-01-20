@interface MapsSuggestionsTrafficAndETAResult
- (BOOL)isSuccess;
- (MapsSuggestionsTrafficAndETAResult)initWithGEOTrafficAndETAResult:(id)a3;
- (NSString)longTrafficString;
- (NSString)shortTrafficString;
- (NSString)spokenRouteName;
- (NSString)writtenRouteName;
- (double)seconds;
- (void)setIsSuccess:(BOOL)a3;
- (void)setLongTrafficString:(id)a3;
- (void)setSeconds:(double)a3;
- (void)setShortTrafficString:(id)a3;
- (void)setSpokenRouteName:(id)a3;
- (void)setWrittenRouteName:(id)a3;
@end

@implementation MapsSuggestionsTrafficAndETAResult

- (MapsSuggestionsTrafficAndETAResult)initWithGEOTrafficAndETAResult:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MapsSuggestionsTrafficAndETAResult;
  v5 = [(MapsSuggestionsTrafficAndETAResult *)&v16 init];
  if (v5)
  {
    v5->_isSuccess = [v4 isSuccess];
    [v4 seconds];
    v5->_seconds = v6;
    uint64_t v7 = [v4 shortTrafficString];
    shortTrafficString = v5->_shortTrafficString;
    v5->_shortTrafficString = (NSString *)v7;

    uint64_t v9 = [v4 longTrafficString];
    longTrafficString = v5->_longTrafficString;
    v5->_longTrafficString = (NSString *)v9;

    uint64_t v11 = [v4 writtenRouteName];
    writtenRouteName = v5->_writtenRouteName;
    v5->_writtenRouteName = (NSString *)v11;

    uint64_t v13 = [v4 spokenRouteName];
    spokenRouteName = v5->_spokenRouteName;
    v5->_spokenRouteName = (NSString *)v13;
  }
  return v5;
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (void)setIsSuccess:(BOOL)a3
{
  self->_isSuccess = a3;
}

- (double)seconds
{
  return self->_seconds;
}

- (void)setSeconds:(double)a3
{
  self->_seconds = a3;
}

- (NSString)shortTrafficString
{
  return self->_shortTrafficString;
}

- (void)setShortTrafficString:(id)a3
{
}

- (NSString)longTrafficString
{
  return self->_longTrafficString;
}

- (void)setLongTrafficString:(id)a3
{
}

- (NSString)writtenRouteName
{
  return self->_writtenRouteName;
}

- (void)setWrittenRouteName:(id)a3
{
}

- (NSString)spokenRouteName
{
  return self->_spokenRouteName;
}

- (void)setSpokenRouteName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenRouteName, 0);
  objc_storeStrong((id *)&self->_writtenRouteName, 0);
  objc_storeStrong((id *)&self->_longTrafficString, 0);
  objc_storeStrong((id *)&self->_shortTrafficString, 0);
}

@end