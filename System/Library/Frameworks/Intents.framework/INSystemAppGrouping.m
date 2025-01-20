@interface INSystemAppGrouping
+ (id)groupingForKey:(id)a3 iOS:(id)a4 macOS:(id)a5 watchOS:(id)a6;
- (NSArray)iOS;
- (NSArray)watchOS;
- (NSString)key;
- (NSString)macOS;
- (void)setIOS:(id)a3;
- (void)setKey:(id)a3;
- (void)setMacOS:(id)a3;
- (void)setWatchOS:(id)a3;
@end

@implementation INSystemAppGrouping

- (NSString)key
{
  return self->_key;
}

+ (id)groupingForKey:(id)a3 iOS:(id)a4 macOS:(id)a5 watchOS:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_alloc_init(INSystemAppGrouping);
  [(INSystemAppGrouping *)v13 setKey:v9];
  [(INSystemAppGrouping *)v13 setIOS:v10];
  [(INSystemAppGrouping *)v13 setMacOS:v11];
  [(INSystemAppGrouping *)v13 setWatchOS:v12];

  return v13;
}

- (void)setWatchOS:(id)a3
{
}

- (void)setMacOS:(id)a3
{
}

- (void)setKey:(id)a3
{
}

- (void)setIOS:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchOS, 0);
  objc_storeStrong((id *)&self->_macOS, 0);
  objc_storeStrong((id *)&self->_iOS, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (NSArray)watchOS
{
  return self->_watchOS;
}

- (NSString)macOS
{
  return self->_macOS;
}

- (NSArray)iOS
{
  return self->_iOS;
}

@end