@interface BLTPBBulletin(ReducedPBDescription)
- (id)description;
@end

@implementation BLTPBBulletin(ReducedPBDescription)

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBBulletin;
  v4 = [(BLTPBBulletin *)&v8 description];
  v5 = [(PBCodable *)self redact];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end