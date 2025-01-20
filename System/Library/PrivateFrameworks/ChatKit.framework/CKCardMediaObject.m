@interface CKCardMediaObject
- (BOOL)shouldBeQuickLooked;
- (BOOL)shouldShowViewer;
@end

@implementation CKCardMediaObject

- (BOOL)shouldShowViewer
{
  v2 = [(CKMediaObject *)self transfer];
  char v3 = [v2 isFileDataReady];

  return v3;
}

- (BOOL)shouldBeQuickLooked
{
  return CKIsRunningInMacCatalyst() != 0;
}

@end