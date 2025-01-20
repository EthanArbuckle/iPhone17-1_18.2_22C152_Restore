@interface GEOPDFlyover
+ (BOOL)isValid:(id)a3;
+ (Class)labelType;
+ (Class)notificationMessageType;
+ (id)flyoverForPlaceData:(id)a3;
- (BOOL)hasUseSplines;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)useSplines;
- (GEOPDCameraPathFrame)cameraPathAtIndex:(SEL)a3;
- (GEOPDCameraPathFrame)cameraPaths;
- (GEOPDFlyover)init;
- (GEOPDFlyover)initWithData:(id)a3;
- (GEOPDFlyover)initWithDictionary:(id)a3;
- (GEOPDFlyover)initWithJSON:(id)a3;
- (GEOPDLabelFrame)labelFrameAtIndex:(unint64_t)a3;
- (GEOPDLabelFrame)labelFrames;
- (NSMutableArray)labels;
- (NSMutableArray)notificationMessages;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)bestLocalizedAnnouncementMessage;
- (id)bestLocalizedLabelAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)labelAtIndex:(unint64_t)a3;
- (id)notificationMessageAtIndex:(unint64_t)a3;
- (uint64_t)_reserveCameraPaths:(uint64_t)a1;
- (uint64_t)_reserveLabelFrames:(uint64_t)a1;
- (unint64_t)cameraPathsCount;
- (unint64_t)hash;
- (unint64_t)labelFramesCount;
- (unint64_t)labelsCount;
- (unint64_t)notificationMessagesCount;
- (void)_addNoFlagsLabel:(uint64_t)a1;
- (void)_addNoFlagsNotificationMessage:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCameraPaths;
- (void)_readLabelFrames;
- (void)_readLabels;
- (void)_readNotificationMessages;
- (void)addCameraPath:(GEOPDCameraPathFrame *)a3;
- (void)addLabel:(id)a3;
- (void)addLabelFrame:(GEOPDLabelFrame)a3;
- (void)addNotificationMessage:(id)a3;
- (void)clearCameraPaths;
- (void)clearLabelFrames;
- (void)clearLabels;
- (void)clearNotificationMessages;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCameraPaths:(GEOPDCameraPathFrame *)a3 count:(unint64_t)a4;
- (void)setHasUseSplines:(BOOL)a3;
- (void)setLabelFrames:(GEOPDLabelFrame *)a3 count:(unint64_t)a4;
- (void)setLabels:(id)a3;
- (void)setNotificationMessages:(id)a3;
- (void)setUseSplines:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDFlyover

+ (id)flyoverForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__GEOPDFlyover_PlaceDataExtras__flyoverForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:13 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __53__GEOPDFlyover_PlaceDataExtras__flyoverForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue flyover](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (id)bestLocalizedAnnouncementMessage
{
  v2 = [(GEOPDFlyover *)self notificationMessages];
  id v3 = +[GEOLocalizedString bestStringForCurrentLocale:v2 fallbackToFirstAvailable:1];

  return v3;
}

- (GEOPDFlyover)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDFlyover;
  v2 = [(GEOPDFlyover *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDFlyover)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDFlyover;
  id v3 = [(GEOPDFlyover *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  [(GEOPDFlyover *)self clearCameraPaths];
  [(GEOPDFlyover *)self clearLabelFrames];
  v3.receiver = self;
  v3.super_class = (Class)GEOPDFlyover;
  [(GEOPDFlyover *)&v3 dealloc];
}

- (void)_readCameraPaths
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 96) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDFlyoverReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCameraPaths_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)cameraPathsCount
{
  return self->_cameraPathsCount;
}

- (GEOPDCameraPathFrame)cameraPaths
{
  return self->_cameraPaths;
}

- (uint64_t)_reserveCameraPaths:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 32);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (88 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 16), 88 * v9, 0x83BB5EC5uLL);
    if (result)
    {
      *(void *)(a1 + 32) = v9;
      *(void *)(a1 + 16) = result;
      bzero((void *)(result + 88 * *(void *)(a1 + 24)), 88 * (v9 - *(void *)(a1 + 24)));
      return 1;
    }
  }
  return result;
}

- (void)clearCameraPaths
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_cameraPathsSpace = 0;
  self->_cameraPathsCount = 0;
  free(self->_cameraPaths);
  self->_cameraPaths = 0;
}

- (void)addCameraPath:(GEOPDCameraPathFrame *)a3
{
  -[GEOPDFlyover _readCameraPaths]((uint64_t)self);
  GEOPDCameraPathFrame v5 = *a3;
  if (self && -[GEOPDFlyover _reserveCameraPaths:]((uint64_t)self, 1uLL)) {
    self->_cameraPaths[self->_cameraPathsCount++] = v5;
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (GEOPDCameraPathFrame)cameraPathAtIndex:(SEL)a3
{
  -[GEOPDFlyover _readCameraPaths]((uint64_t)self);
  unint64_t cameraPathsCount = self->_cameraPathsCount;
  if (cameraPathsCount <= a4)
  {
    unint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C4A8];
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a4, cameraPathsCount);
    id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];
    [v12 raise];
  }
  v13 = &self->_cameraPaths[a4];
  long long v14 = *(_OWORD *)&v13->var7;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&v13->var5;
  *(_OWORD *)&retstr->var7 = v14;
  *(_OWORD *)&retstr->var9 = *(_OWORD *)&v13->var9;
  *(void *)&retstr->var11 = *(void *)&v13->var11;
  long long v15 = *(_OWORD *)&v13->var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13->var0;
  *(_OWORD *)&retstr->var3 = v15;
  return result;
}

- (void)setCameraPaths:(GEOPDCameraPathFrame *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  [(GEOPDFlyover *)self clearCameraPaths];
  if (-[GEOPDFlyover _reserveCameraPaths:]((uint64_t)self, a4))
  {
    memcpy(self->_cameraPaths, a3, 88 * a4);
    self->_unint64_t cameraPathsCount = a4;
  }
}

- (BOOL)useSplines
{
  return self->_useSplines;
}

- (void)setUseSplines:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_useSplines = a3;
}

- (void)setHasUseSplines:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasUseSplines
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readLabelFrames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 96) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDFlyoverReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabelFrames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)labelFramesCount
{
  return self->_labelFramesCount;
}

- (GEOPDLabelFrame)labelFrames
{
  return self->_labelFrames;
}

- (uint64_t)_reserveLabelFrames:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 48);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 56);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (16 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 40), 16 * v9, 0x55BF464EuLL);
    if (result)
    {
      *(void *)(a1 + 56) = v9;
      *(void *)(a1 + 40) = result;
      bzero((void *)(result + 16 * *(void *)(a1 + 48)), 16 * (v9 - *(void *)(a1 + 48)));
      return 1;
    }
  }
  return result;
}

- (void)clearLabelFrames
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  self->_labelFramesSpace = 0;
  self->_labelFramesCount = 0;
  free(self->_labelFrames);
  self->_labelFrames = 0;
}

- (void)addLabelFrame:(GEOPDLabelFrame)a3
{
  uint64_t v3 = *(void *)&a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  -[GEOPDFlyover _readLabelFrames]((uint64_t)self);
  if (self && -[GEOPDFlyover _reserveLabelFrames:]((uint64_t)self, 1uLL))
  {
    unint64_t v6 = &self->_labelFrames[self->_labelFramesCount];
    *(void *)&v6->var0 = v4;
    *(void *)&v6->var2 = v3;
    ++self->_labelFramesCount;
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (GEOPDLabelFrame)labelFrameAtIndex:(unint64_t)a3
{
  -[GEOPDFlyover _readLabelFrames]((uint64_t)self);
  unint64_t labelFramesCount = self->_labelFramesCount;
  if (labelFramesCount <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, labelFramesCount);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  uint64_t v10 = &self->_labelFrames[a3];
  uint64_t v11 = *(void *)&v10->var0;
  uint64_t v12 = *(void *)&v10->var2;
  result.var2 = *(float *)&v12;
  result.var3 = *($162FAC071EAEBA15A6F8D573D0754DF6 *)((char *)&v12 + 4);
  result.var0 = *(float *)&v11;
  result.var1 = HIDWORD(v11);
  return result;
}

- (void)setLabelFrames:(GEOPDLabelFrame *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  [(GEOPDFlyover *)self clearLabelFrames];
  if (-[GEOPDFlyover _reserveLabelFrames:]((uint64_t)self, a4))
  {
    memcpy(self->_labelFrames, a3, 16 * a4);
    self->_unint64_t labelFramesCount = a4;
  }
}

- (void)_readLabels
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDFlyoverReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabels_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)labels
{
  -[GEOPDFlyover _readLabels]((uint64_t)self);
  labels = self->_labels;

  return labels;
}

- (void)setLabels:(id)a3
{
  uint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  labels = self->_labels;
  self->_labels = v4;
}

- (void)clearLabels
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  labels = self->_labels;

  [(NSMutableArray *)labels removeAllObjects];
}

- (void)addLabel:(id)a3
{
  id v4 = a3;
  -[GEOPDFlyover _readLabels]((uint64_t)self);
  -[GEOPDFlyover _addNoFlagsLabel:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsLabel:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)labelsCount
{
  -[GEOPDFlyover _readLabels]((uint64_t)self);
  labels = self->_labels;

  return [(NSMutableArray *)labels count];
}

- (id)labelAtIndex:(unint64_t)a3
{
  -[GEOPDFlyover _readLabels]((uint64_t)self);
  labels = self->_labels;

  return (id)[(NSMutableArray *)labels objectAtIndex:a3];
}

+ (Class)labelType
{
  return (Class)objc_opt_class();
}

- (void)_readNotificationMessages
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(unsigned char *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDFlyoverReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNotificationMessages_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)notificationMessages
{
  -[GEOPDFlyover _readNotificationMessages]((uint64_t)self);
  notificationMessages = self->_notificationMessages;

  return notificationMessages;
}

- (void)setNotificationMessages:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  notificationMessages = self->_notificationMessages;
  self->_notificationMessages = v4;
}

- (void)clearNotificationMessages
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  notificationMessages = self->_notificationMessages;

  [(NSMutableArray *)notificationMessages removeAllObjects];
}

- (void)addNotificationMessage:(id)a3
{
  id v4 = a3;
  -[GEOPDFlyover _readNotificationMessages]((uint64_t)self);
  -[GEOPDFlyover _addNoFlagsNotificationMessage:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsNotificationMessage:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 72);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 72);
      *(void *)(a1 + 72) = v5;

      id v4 = *(void **)(a1 + 72);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)notificationMessagesCount
{
  -[GEOPDFlyover _readNotificationMessages]((uint64_t)self);
  notificationMessages = self->_notificationMessages;

  return [(NSMutableArray *)notificationMessages count];
}

- (id)notificationMessageAtIndex:(unint64_t)a3
{
  -[GEOPDFlyover _readNotificationMessages]((uint64_t)self);
  notificationMessages = self->_notificationMessages;

  return (id)[(NSMutableArray *)notificationMessages objectAtIndex:a3];
}

+ (Class)notificationMessageType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDFlyover;
  id v4 = [(GEOPDFlyover *)&v8 description];
  id v5 = [(GEOPDFlyover *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDFlyover _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 24))
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 24)];
      if (*(void *)(a1 + 24))
      {
        uint64_t v6 = 0;
        unint64_t v7 = 0;
        do
        {
          objc_super v8 = _GEOPDCameraPathFrameDictionaryRepresentation(*(void *)(a1 + 16) + v6, a2);
          [v5 addObject:v8];

          ++v7;
          v6 += 88;
        }
        while (v7 < *(void *)(a1 + 24));
      }
      if (a2) {
        unint64_t v9 = @"cameraPath";
      }
      else {
        unint64_t v9 = @"camera_path";
      }
      [v4 setObject:v5 forKey:v9];
    }
    if (*(unsigned char *)(a1 + 96))
    {
      uint64_t v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 92)];
      if (a2) {
        uint64_t v11 = @"useSplines";
      }
      else {
        uint64_t v11 = @"use_splines";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if (*(void *)(a1 + 48))
    {
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 48)];
      if (*(void *)(a1 + 48))
      {
        uint64_t v13 = 0;
        unint64_t v14 = 0;
        do
        {
          long long v15 = _GEOPDLabelFrameDictionaryRepresentation(*(void *)(a1 + 40) + v13, a2);
          [v12 addObject:v15];

          ++v14;
          v13 += 16;
        }
        while (v14 < *(void *)(a1 + 48));
      }
      if (a2) {
        v16 = @"labelFrame";
      }
      else {
        v16 = @"label_frame";
      }
      [v4 setObject:v12 forKey:v16];
    }
    if ([*(id *)(a1 + 64) count])
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v18 = *(id *)(a1 + 64);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v40 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = [v23 dictionaryRepresentation];
            }
            [v17 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v20);
      }

      [v4 setObject:v17 forKey:@"label"];
    }
    if ([*(id *)(a1 + 72) count])
    {
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 72), "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v26 = *(id *)(a1 + 72);
      uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v36 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v35 + 1) + 8 * j);
            if (a2) {
              [v31 jsonRepresentation];
            }
            else {
            v32 = objc_msgSend(v31, "dictionaryRepresentation", (void)v35);
            }
            objc_msgSend(v25, "addObject:", v32, (void)v35);
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v28);
      }

      if (a2) {
        v33 = @"notificationMessage";
      }
      else {
        v33 = @"notification_message";
      }
      objc_msgSend(v4, "setObject:forKey:", v25, v33, (void)v35);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDFlyover _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDFlyover)initWithDictionary:(id)a3
{
  return (GEOPDFlyover *)-[GEOPDFlyover _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        uint64_t v6 = @"cameraPath";
      }
      else {
        uint64_t v6 = @"camera_path";
      }
      unint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v66 objects:v73 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v67;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v67 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v65 = 0;
                long long v63 = 0u;
                long long v64 = 0u;
                long long v61 = 0u;
                long long v62 = 0u;
                long long v60 = 0u;
                _GEOPDCameraPathFrameFromDictionaryRepresentation(v13, (uint64_t)&v60, a3);
                v58[2] = v62;
                v58[3] = v63;
                v58[4] = v64;
                uint64_t v59 = v65;
                v58[0] = v60;
                v58[1] = v61;
                [a1 addCameraPath:v58];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v66 objects:v73 count:16];
          }
          while (v10);
        }
      }
      if (a3) {
        unint64_t v14 = @"useSplines";
      }
      else {
        unint64_t v14 = @"use_splines";
      }
      long long v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setUseSplines:", objc_msgSend(v15, "BOOLValue"));
      }

      if (a3) {
        v16 = @"labelFrame";
      }
      else {
        v16 = @"label_frame";
      }
      v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v54 objects:v72 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v55;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v55 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(void **)(*((void *)&v54 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v60 = 0uLL;
                _GEOPDLabelFrameFromDictionaryRepresentation(v23, (uint64_t)&v60, a3);
                [a1 addLabelFrame:v60];
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v54 objects:v72 count:16];
          }
          while (v20);
        }
      }
      v24 = [v5 objectForKeyedSubscript:@"label"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v50 objects:v71 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v51;
          do
          {
            for (uint64_t k = 0; k != v27; ++k)
            {
              if (*(void *)v51 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v50 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v31 = [GEOPDLabelLocalizations alloc];
                if (a3) {
                  uint64_t v32 = [(GEOPDLabelLocalizations *)v31 initWithJSON:v30];
                }
                else {
                  uint64_t v32 = [(GEOPDLabelLocalizations *)v31 initWithDictionary:v30];
                }
                v33 = (void *)v32;
                [a1 addLabel:v32];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v50 objects:v71 count:16];
          }
          while (v27);
        }
      }
      if (a3) {
        v34 = @"notificationMessage";
      }
      else {
        v34 = @"notification_message";
      }
      long long v35 = [v5 objectForKeyedSubscript:v34];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v36 = v35;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v46 objects:v70 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v47;
          do
          {
            for (uint64_t m = 0; m != v38; ++m)
            {
              if (*(void *)v47 != v39) {
                objc_enumerationMutation(v36);
              }
              uint64_t v41 = *(void *)(*((void *)&v46 + 1) + 8 * m);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v42 = [GEOLocalizedString alloc];
                if (a3) {
                  uint64_t v43 = [(GEOLocalizedString *)v42 initWithJSON:v41];
                }
                else {
                  uint64_t v43 = [(GEOLocalizedString *)v42 initWithDictionary:v41];
                }
                v44 = (void *)v43;
                [a1 addNotificationMessage:v43];
              }
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v46 objects:v70 count:16];
          }
          while (v38);
        }
      }
    }
  }

  return a1;
}

- (GEOPDFlyover)initWithJSON:(id)a3
{
  return (GEOPDFlyover *)-[GEOPDFlyover _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_71;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_71;
    }
    GEOPDFlyoverReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPDFlyoverCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDFlyoverIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDFlyoverReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDFlyoverIsDirty((uint64_t)self) & 1) == 0)
  {
    id v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOPDFlyover *)self readAll:0];
    if (self->_cameraPathsCount)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        uint64_t v28 = 0;
        PBDataWriterPlaceMark();
        GEOPDCameraPathFrameWriteTo((uint64_t)&self->_cameraPaths[v6]);
        PBDataWriterRecallMark();
        ++v7;
        ++v6;
      }
      while (v7 < self->_cameraPathsCount);
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_labelFramesCount)
    {
      uint64_t v8 = 0;
      unint64_t v9 = 0;
      do
      {
        uint64_t v28 = 0;
        PBDataWriterPlaceMark();
        GEOPDLabelFrameWriteTo((uint64_t)&self->_labelFrames[v8]);
        PBDataWriterRecallMark();
        ++v9;
        ++v8;
      }
      while (v9 < self->_labelFramesCount);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v10 = self->_labels;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unint64_t v14 = self->_notificationMessages;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v29 count:16];
      }
      while (v15);
    }
  }
}

- (void)copyTo:(id)a3
{
  id v4 = (id *)a3;
  [(GEOPDFlyover *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 20) = self->_readerMarkPos;
  *((_DWORD *)v4 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPDFlyover *)self cameraPathsCount])
  {
    [v4 clearCameraPaths];
    unint64_t v5 = [(GEOPDFlyover *)self cameraPathsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        [(GEOPDFlyover *)self cameraPathAtIndex:i];
        [v4 addCameraPath:v21];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v4 + 92) = self->_useSplines;
    *((unsigned char *)v4 + 96) |= 1u;
  }
  if ([(GEOPDFlyover *)self labelFramesCount])
  {
    [v4 clearLabelFrames];
    unint64_t v8 = [(GEOPDFlyover *)self labelFramesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEOPDFlyover *)self labelFrameAtIndex:j];
        objc_msgSend(v4, "addLabelFrame:", v11, v12);
      }
    }
  }
  if ([(GEOPDFlyover *)self labelsCount])
  {
    [v4 clearLabels];
    unint64_t v13 = [(GEOPDFlyover *)self labelsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(GEOPDFlyover *)self labelAtIndex:k];
        [v4 addLabel:v16];
      }
    }
  }
  if ([(GEOPDFlyover *)self notificationMessagesCount])
  {
    [v4 clearNotificationMessages];
    unint64_t v17 = [(GEOPDFlyover *)self notificationMessagesCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        long long v20 = [(GEOPDFlyover *)self notificationMessageAtIndex:m];
        [v4 addNotificationMessage:v20];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDFlyoverReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      unint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_25;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPDFlyover *)self readAll:0];
  unint64_t cameraPathsCount = self->_cameraPathsCount;
  if (cameraPathsCount)
  {
    -[GEOPDFlyover _reserveCameraPaths:](v5, cameraPathsCount);
    memcpy(*(void **)(v5 + 16), self->_cameraPaths, 88 * self->_cameraPathsCount);
    *(void *)(v5 + 24) = self->_cameraPathsCount;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 92) = self->_useSplines;
    *(unsigned char *)(v5 + 96) |= 1u;
  }
  unint64_t labelFramesCount = self->_labelFramesCount;
  if (labelFramesCount)
  {
    -[GEOPDFlyover _reserveLabelFrames:](v5, labelFramesCount);
    memcpy(*(void **)(v5 + 40), self->_labelFrames, 16 * self->_labelFramesCount);
    *(void *)(v5 + 48) = self->_labelFramesCount;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v11 = self->_labels;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addLabel:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v12);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v8 = self->_notificationMessages;
  uint64_t v16 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v8);
        }
        uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        [(id)v5 addNotificationMessage:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }
LABEL_25:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_4;
  }
  [(GEOPDFlyover *)self readAll:1];
  [v4 readAll:1];
  unint64_t cameraPathsCount = self->_cameraPathsCount;
  if ((const void *)cameraPathsCount != v4[3] || memcmp(self->_cameraPaths, v4[2], 88 * cameraPathsCount)) {
    goto LABEL_4;
  }
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    if (((_BYTE)v4[12] & 1) == 0) {
      goto LABEL_14;
    }
LABEL_4:
    char v6 = 0;
    goto LABEL_5;
  }
  if (((_BYTE)v4[12] & 1) == 0) {
    goto LABEL_4;
  }
  if (self->_useSplines)
  {
    if (!*((unsigned char *)v4 + 92)) {
      goto LABEL_4;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
    goto LABEL_4;
  }
LABEL_14:
  unint64_t labelFramesCount = self->_labelFramesCount;
  if ((const void *)labelFramesCount != v4[6]) {
    goto LABEL_4;
  }
  if (memcmp(self->_labelFrames, v4[5], 16 * labelFramesCount)) {
    goto LABEL_4;
  }
  labels = self->_labels;
  if ((unint64_t)labels | (unint64_t)v4[8])
  {
    if (!-[NSMutableArray isEqual:](labels, "isEqual:")) {
      goto LABEL_4;
    }
  }
  notificationMessages = self->_notificationMessages;
  if ((unint64_t)notificationMessages | (unint64_t)v4[9]) {
    char v6 = -[NSMutableArray isEqual:](notificationMessages, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_5:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPDFlyover *)self readAll:1];
  uint64_t v3 = PBHashBytes();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_useSplines;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4 ^ PBHashBytes();
  uint64_t v6 = v5 ^ [(NSMutableArray *)self->_labels hash];
  return v6 ^ [(NSMutableArray *)self->_notificationMessages hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 cameraPathsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (v4)
      {
        [v4 cameraPathAtIndex:i];
      }
      else
      {
        uint64_t v32 = 0;
        memset(v31, 0, sizeof(v31));
      }
      [(GEOPDFlyover *)self addCameraPath:v31];
    }
  }
  if (*((unsigned char *)v4 + 96))
  {
    self->_useSplines = *((unsigned char *)v4 + 92);
    *(unsigned char *)&self->_flags |= 1u;
  }
  uint64_t v8 = [v4 labelFramesCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
    {
      uint64_t v11 = [v4 labelFrameAtIndex:j];
      -[GEOPDFlyover addLabelFrame:](self, "addLabelFrame:", v11, v12);
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = *((id *)v4 + 8);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        [(GEOPDFlyover *)self addLabel:*(void *)(*((void *)&v27 + 1) + 8 * k)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v15);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = *((id *)v4 + 9);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t m = 0; m != v20; ++m)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        -[GEOPDFlyover addNotificationMessage:](self, "addNotificationMessage:", *(void *)(*((void *)&v23 + 1) + 8 * m), (void)v23);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v20);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationMessages, 0);
  objc_storeStrong((id *)&self->_labels, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)bestLocalizedLabelAtIndex:(unint64_t)a3
{
  if ([(GEOPDFlyover *)self labelsCount] >= a3)
  {
    uint64_t v6 = [(GEOPDFlyover *)self labelAtIndex:a3];
    uint64_t v5 = [v6 bestLocalizedName];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

@end