@interface ASVARSnapshotManager
+ (void)showARSnapshotUIForImage:(id)a3;
@end

@implementation ASVARSnapshotManager

+ (void)showARSnapshotUIForImage:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F99DF8];
  id v4 = a3;
  id v6 = objc_alloc_init(v3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F99E00]);
  [v5 setFlashStyle:0];
  [v5 setSaveLocation:1];
  [v6 showScreenshotUIForImage:v4 options:v5];
}

@end