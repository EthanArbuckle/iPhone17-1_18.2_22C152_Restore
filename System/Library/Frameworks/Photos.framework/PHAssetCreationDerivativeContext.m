@interface PHAssetCreationDerivativeContext
- (BOOL)thumbnailWriteSucceeded;
- (CGSize)assetOrientedImageSize;
- (CGSize)embeddedThumbnailSize;
- (NSArray)auxiliaryImageRecords;
- (NSData)imageData;
- (NSData)originalHash;
- (NSString)assetExtension;
- (NSString)assetUUID;
- (NSString)fullsizeRenderImagePath;
- (NSString)fullsizeRenderVideoPath;
- (NSString)originalUTI;
- (NSString)pathForOriginalFile;
- (NSString)pathForVideoPreviewFile;
- (NSString)thumbnailIdentifier;
- (NSURL)fileURLForThumbnailFile;
- (PLManagedAsset)asset;
- (PLThumbnailManager)thumbnailManager;
- (int64_t)assetOrientation;
- (int64_t)maxPixelSize;
- (int64_t)nextAvailableThumbnailIndex;
- (signed)assetKind;
- (void)setAsset:(id)a3;
- (void)setAssetExtension:(id)a3;
- (void)setAssetKind:(signed __int16)a3;
- (void)setAssetOrientation:(int64_t)a3;
- (void)setAssetOrientedImageSize:(CGSize)a3;
- (void)setAssetUUID:(id)a3;
- (void)setAuxiliaryImageRecords:(id)a3;
- (void)setEmbeddedThumbnailSize:(CGSize)a3;
- (void)setFileURLForThumbnailFile:(id)a3;
- (void)setFullsizeRenderImagePath:(id)a3;
- (void)setFullsizeRenderVideoPath:(id)a3;
- (void)setImageData:(id)a3;
- (void)setMaxPixelSize:(int64_t)a3;
- (void)setNextAvailableThumbnailIndex:(int64_t)a3;
- (void)setOriginalHash:(id)a3;
- (void)setOriginalUTI:(id)a3;
- (void)setPathForOriginalFile:(id)a3;
- (void)setPathForVideoPreviewFile:(id)a3;
- (void)setThumbnailIdentifier:(id)a3;
- (void)setThumbnailManager:(id)a3;
- (void)setThumbnailWriteSucceeded:(BOOL)a3;
@end

@implementation PHAssetCreationDerivativeContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImageRecords, 0);
  objc_storeStrong((id *)&self->_fullsizeRenderVideoPath, 0);
  objc_storeStrong((id *)&self->_pathForVideoPreviewFile, 0);
  objc_storeStrong((id *)&self->_pathForOriginalFile, 0);
  objc_storeStrong((id *)&self->_fullsizeRenderImagePath, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_assetExtension, 0);
  objc_storeStrong((id *)&self->_originalUTI, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_originalHash, 0);
  objc_storeStrong((id *)&self->_fileURLForThumbnailFile, 0);
  objc_storeStrong((id *)&self->_thumbnailIdentifier, 0);

  objc_storeStrong((id *)&self->_thumbnailManager, 0);
}

- (void)setAuxiliaryImageRecords:(id)a3
{
}

- (NSArray)auxiliaryImageRecords
{
  return self->_auxiliaryImageRecords;
}

- (void)setFullsizeRenderVideoPath:(id)a3
{
}

- (NSString)fullsizeRenderVideoPath
{
  return self->_fullsizeRenderVideoPath;
}

- (void)setPathForVideoPreviewFile:(id)a3
{
}

- (NSString)pathForVideoPreviewFile
{
  return self->_pathForVideoPreviewFile;
}

- (void)setPathForOriginalFile:(id)a3
{
}

- (NSString)pathForOriginalFile
{
  return self->_pathForOriginalFile;
}

- (void)setFullsizeRenderImagePath:(id)a3
{
}

- (NSString)fullsizeRenderImagePath
{
  return self->_fullsizeRenderImagePath;
}

- (void)setImageData:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setAssetExtension:(id)a3
{
}

- (NSString)assetExtension
{
  return self->_assetExtension;
}

- (void)setMaxPixelSize:(int64_t)a3
{
  self->_maxPixelSize = a3;
}

- (int64_t)maxPixelSize
{
  return self->_maxPixelSize;
}

- (void)setEmbeddedThumbnailSize:(CGSize)a3
{
  self->_embeddedThumbnailSize = a3;
}

- (CGSize)embeddedThumbnailSize
{
  double width = self->_embeddedThumbnailSize.width;
  double height = self->_embeddedThumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAssetOrientedImageSize:(CGSize)a3
{
  self->_assetOrientedImageSize = a3;
}

- (CGSize)assetOrientedImageSize
{
  double width = self->_assetOrientedImageSize.width;
  double height = self->_assetOrientedImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAssetOrientation:(int64_t)a3
{
  self->_assetOrientation = a3;
}

- (int64_t)assetOrientation
{
  return self->_assetOrientation;
}

- (void)setOriginalUTI:(id)a3
{
}

- (NSString)originalUTI
{
  return self->_originalUTI;
}

- (void)setAssetKind:(signed __int16)a3
{
  self->_assetKind = a3;
}

- (signed)assetKind
{
  return self->_assetKind;
}

- (void)setAssetUUID:(id)a3
{
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (void)setAsset:(id)a3
{
}

- (PLManagedAsset)asset
{
  return self->_asset;
}

- (void)setOriginalHash:(id)a3
{
}

- (NSData)originalHash
{
  return self->_originalHash;
}

- (void)setFileURLForThumbnailFile:(id)a3
{
}

- (NSURL)fileURLForThumbnailFile
{
  return self->_fileURLForThumbnailFile;
}

- (void)setThumbnailIdentifier:(id)a3
{
}

- (NSString)thumbnailIdentifier
{
  return self->_thumbnailIdentifier;
}

- (void)setThumbnailWriteSucceeded:(BOOL)a3
{
  self->_thumbnailWriteSucceeded = a3;
}

- (BOOL)thumbnailWriteSucceeded
{
  return self->_thumbnailWriteSucceeded;
}

- (void)setThumbnailManager:(id)a3
{
}

- (PLThumbnailManager)thumbnailManager
{
  return self->_thumbnailManager;
}

- (void)setNextAvailableThumbnailIndex:(int64_t)a3
{
  self->_nextAvailableThumbnailIndex = a3;
}

- (int64_t)nextAvailableThumbnailIndex
{
  return self->_nextAvailableThumbnailIndex;
}

@end