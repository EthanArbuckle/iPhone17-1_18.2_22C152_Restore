@interface TDCustomAssetImportInfo
- ($01BB1521EC52D44A8E7628F5261DCEC8)sliceInsets;
- (BOOL)isTemplate;
- (BOOL)optOutOfThinning;
- (CGRect)alignmentRect;
- (CGSize)resizableSliceSize;
- (CUIRenditionKey)renditionKey;
- (NSDate)modificationDate;
- (NSString)elementName;
- (NSString)name;
- (NSString)partName;
- (TDCustomAssetSource)customAsset;
- (int64_t)renditionSubtype;
- (int64_t)renditionType;
- (int64_t)resizingMode;
- (int64_t)templateRenderingMode;
- (void)dealloc;
- (void)setAlignmentRect:(CGRect)a3;
- (void)setCustomAsset:(id)a3;
- (void)setElementName:(id)a3;
- (void)setIsTemplate:(BOOL)a3;
- (void)setModificationDate:(id)a3;
- (void)setName:(id)a3;
- (void)setOptOutOfThinning:(BOOL)a3;
- (void)setPartName:(id)a3;
- (void)setRenditionKey:(id)a3;
- (void)setRenditionType:(int64_t)a3;
- (void)setResizableSliceSize:(CGSize)a3;
- (void)setResizingMode:(int64_t)a3;
- (void)setSliceInsets:(id)a3;
- (void)setTemplateRenderingMode:(int64_t)a3;
@end

@implementation TDCustomAssetImportInfo

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TDCustomAssetImportInfo;
  [(TDCustomAssetImportInfo *)&v3 dealloc];
}

- (int64_t)renditionSubtype
{
  if ([(TDCustomAssetImportInfo *)self resizingMode])
  {
    if ([(TDCustomAssetImportInfo *)self resizingMode] == 1)
    {
      unint64_t v3 = [(TDCustomAssetImportInfo *)self renditionType];
      if (v3 < 4)
      {
        v4 = &unk_235184A08;
        return v4[v3];
      }
    }
  }
  else
  {
    unint64_t v3 = [(TDCustomAssetImportInfo *)self renditionType];
    if (v3 < 4)
    {
      v4 = &unk_2351849E8;
      return v4[v3];
    }
  }
  return 0;
}

- (BOOL)isTemplate
{
  return (unint64_t)([(TDCustomAssetImportInfo *)self templateRenderingMode] - 1) < 2;
}

- (void)setIsTemplate:(BOOL)a3
{
}

- (CUIRenditionKey)renditionKey
{
  return self->_renditionKey;
}

- (void)setRenditionKey:(id)a3
{
}

- (NSString)elementName
{
  return self->_elementName;
}

- (void)setElementName:(id)a3
{
}

- (NSString)partName
{
  return self->_partName;
}

- (void)setPartName:(id)a3
{
}

- (TDCustomAssetSource)customAsset
{
  return (TDCustomAssetSource *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCustomAsset:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)sliceInsets
{
  double top = self->_sliceInsets.top;
  double left = self->_sliceInsets.left;
  double bottom = self->_sliceInsets.bottom;
  double right = self->_sliceInsets.right;
  result.var3 = right;
  result.var2 = bottom;
  result.var1 = left;
  result.var0 = top;
  return result;
}

- (void)setSliceInsets:(id)a3
{
  self->_sliceInsets = ($6B9B24F574F852F8EB8F2DB2BEA94E23)a3;
}

- (int64_t)renditionType
{
  return self->_renditionType;
}

- (void)setRenditionType:(int64_t)a3
{
  self->_renditionType = a3;
}

- (int64_t)resizingMode
{
  return self->_resizingMode;
}

- (void)setResizingMode:(int64_t)a3
{
  self->_resizingMode = a3;
}

- (CGSize)resizableSliceSize
{
  double width = self->_resizableSliceSize.width;
  double height = self->_resizableSliceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setResizableSliceSize:(CGSize)a3
{
  self->_resizableSliceSize = a3;
}

- (int64_t)templateRenderingMode
{
  return self->_templateRenderingMode;
}

- (void)setTemplateRenderingMode:(int64_t)a3
{
  self->_templateRenderingMode = a3;
}

- (BOOL)optOutOfThinning
{
  return self->_optOutOfThinning;
}

- (void)setOptOutOfThinning:(BOOL)a3
{
  self->_optOutOfThinning = a3;
}

- (CGRect)alignmentRect
{
  double x = self->_alignmentRect.origin.x;
  double y = self->_alignmentRect.origin.y;
  double width = self->_alignmentRect.size.width;
  double height = self->_alignmentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAlignmentRect:(CGRect)a3
{
  self->_alignmentRect = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

@end