@interface ASDMutableIAPInfo
- (void)setExpirationTimestamp:(id)a3;
- (void)setLastModifiedTimestamp:(id)a3;
- (void)setPurchaseTimestamp:(id)a3;
@end

@implementation ASDMutableIAPInfo

- (void)setExpirationTimestamp:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  [a3 doubleValue];
  objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(ASDIAPInfo *)self setExpirationDate:v5];
}

- (void)setLastModifiedTimestamp:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  [a3 doubleValue];
  objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(ASDIAPInfo *)self setLastModifiedDate:v5];
}

- (void)setPurchaseTimestamp:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  [a3 doubleValue];
  objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(ASDIAPInfo *)self setPurchaseDate:v5];
}

@end