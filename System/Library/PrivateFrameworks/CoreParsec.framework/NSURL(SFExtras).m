@interface NSURL(SFExtras)
- (id)sf_asPunchout;
@end

@implementation NSURL(SFExtras)

- (id)sf_asPunchout
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F9A2F8]);
  v5[0] = a1;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 setUrls:v3];

  return v2;
}

@end