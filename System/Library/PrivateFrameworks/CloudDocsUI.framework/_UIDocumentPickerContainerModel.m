@interface _UIDocumentPickerContainerModel
- (BOOL)afterInitialUpdate;
- (NSArray)modelObjects;
- (NSArray)pickableTypes;
- (NSMutableArray)updateHandlers;
- (NSOperationQueue)thumbnailQueue;
- (_UIDocumentPickerContainerModel)init;
- (id)displayTitle;
- (int)sortOrder;
- (unint64_t)pickerMode;
- (void)dealloc;
- (void)setSortOrder:(int)a3;
- (void)setThumbnailQueue:(id)a3;
- (void)setUpdateHandlers:(id)a3;
@end

@implementation _UIDocumentPickerContainerModel

- (_UIDocumentPickerContainerModel)init
{
  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentPickerContainerModel;
  v2 = [(_UIDocumentPickerContainerModel *)&v9 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    thumbnailQueue = v2->_thumbnailQueue;
    v2->_thumbnailQueue = v3;

    [(NSOperationQueue *)v2->_thumbnailQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_thumbnailQueue setName:@"Thumbnail loading queue"];
    [(NSOperationQueue *)v2->_thumbnailQueue setQualityOfService:17];
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create(0, v5);
    underlyingQueue = v2->_underlyingQueue;
    v2->_underlyingQueue = (OS_dispatch_queue *)v6;

    [(NSOperationQueue *)v2->_thumbnailQueue setUnderlyingQueue:v2->_underlyingQueue];
  }
  return v2;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_thumbnailQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerContainerModel;
  [(_UIDocumentPickerContainerModel *)&v3 dealloc];
}

- (NSArray)modelObjects
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (id)displayTitle
{
  return &stru_26E0221C0;
}

- (BOOL)afterInitialUpdate
{
  return 0;
}

- (void)setSortOrder:(int)a3
{
  self->_sortOrder = a3;
  [(_UIDocumentPickerContainerModel *)self updateSortDescriptors];
}

- (NSArray)pickableTypes
{
  return 0;
}

- (unint64_t)pickerMode
{
  return 1;
}

- (int)sortOrder
{
  return self->_sortOrder;
}

- (NSMutableArray)updateHandlers
{
  return self->_updateHandlers;
}

- (void)setUpdateHandlers:(id)a3
{
}

- (NSOperationQueue)thumbnailQueue
{
  return self->_thumbnailQueue;
}

- (void)setThumbnailQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailQueue, 0);
  objc_storeStrong((id *)&self->_updateHandlers, 0);

  objc_storeStrong((id *)&self->_underlyingQueue, 0);
}

@end