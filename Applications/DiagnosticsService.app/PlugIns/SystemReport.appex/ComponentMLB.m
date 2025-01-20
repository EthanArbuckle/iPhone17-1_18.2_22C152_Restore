@interface ComponentMLB
- (BOOL)isPresent;
- (id)serialNumber;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentMLB

- (BOOL)isPresent
{
  v2 = [(ComponentMLB *)self serialNumber];
  BOOL valid = isValidSerialNumber(v2);

  return valid;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(ComponentMLB *)self serialNumber];
  [v4 setObject:v5 forKeyedSubscript:@"serialNumber"];
}

- (id)serialNumber
{
  v2 = (void *)MGCopyAnswer();
  v3 = stringOrNull(v2);

  return v3;
}

@end