@interface CRKConcreteSharingPrimitives
- (id)startAirDropTransferWithAutoAccept:(BOOL)a3 hideProgress:(BOOL)a4 senderName:(id)a5 previewImageData:(id)a6 bundleID:(id)a7 sourceBundleID:(id)a8 itemsDescription:(id)a9 fileURLs:(id)a10 resultHandler:(id)a11;
@end

@implementation CRKConcreteSharingPrimitives

- (id)startAirDropTransferWithAutoAccept:(BOOL)a3 hideProgress:(BOOL)a4 senderName:(id)a5 previewImageData:(id)a6 bundleID:(id)a7 sourceBundleID:(id)a8 itemsDescription:(id)a9 fileURLs:(id)a10 resultHandler:(id)a11
{
  BOOL v15 = a4;
  BOOL v16 = a3;
  id v17 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  v24 = [[CRKConcreteSharingAirDropTransfer alloc] initWithAutoAccept:v16 hideProgress:v15 senderName:v23 previewImageData:v22 bundleID:v21 sourceBundleID:v20 itemsDescription:v19 fileURLs:v18 resultHandler:v17];

  return v24;
}

@end