@interface MFAttachment(PassKit)
- (id)passWithError:()PassKit;
@end

@implementation MFAttachment(PassKit)

- (id)passWithError:()PassKit
{
  v5 = [a1 metadataValueForKey:@"_MFAttachmentPassKey"];
  if (!v5)
  {
    v6 = [a1 fetchDataSynchronously:0];
    v5 = (void *)[objc_alloc(getPKPassClass()) initWithData:v6 error:a3];
  }

  return v5;
}

@end