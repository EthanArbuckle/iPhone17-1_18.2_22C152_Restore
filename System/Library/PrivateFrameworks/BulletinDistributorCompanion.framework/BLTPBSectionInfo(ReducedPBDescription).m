@interface BLTPBSectionInfo(ReducedPBDescription)
- (id)description;
@end

@implementation BLTPBSectionInfo(ReducedPBDescription)

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSectionInfo;
  v4 = [(BLTPBSectionInfo *)&v8 description];
  v5 = [(PBCodable *)self redact];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end