@interface CADGenerationStampedObjectID
- (BOOL)isEqual:(id)a3;
- (CADGenerationStampedObjectID)initWithEntityType:(int)a3 entityID:(int)a4 databaseID:(int)a5 generation:(int)a6;
- (CADGenerationStampedObjectID)initWithEntityType:(int)a3 entityID:(int)a4 generation:(int)a5;
- (Class)classForCoder;
- (int)restoreGeneration;
@end

@implementation CADGenerationStampedObjectID

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CADGenerationStampedObjectID *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v8 = 1;
    goto LABEL_17;
  }
  Class Class = object_getClass(self);
  Class v7 = object_getClass(v5);
  if (Class == v7)
  {
    v9 = v5;
    int v10 = [(CADGenerationStampedObjectID *)self entityType];
    if (v10 != [(CADGenerationStampedObjectID *)v9 entityType]) {
      goto LABEL_15;
    }
    int v11 = [(CADGenerationStampedObjectID *)self entityID];
    if (v11 != [(CADGenerationStampedObjectID *)v9 entityID]) {
      goto LABEL_15;
    }
    int v12 = [(CADGenerationStampedObjectID *)self isTemporary];
    if (v12 != [(CADGenerationStampedObjectID *)v9 isTemporary]) {
      goto LABEL_15;
    }
    int v13 = [(CADGenerationStampedObjectID *)self databaseID];
    if (v13 != [(CADGenerationStampedObjectID *)v9 databaseID]) {
      goto LABEL_15;
    }
    int v14 = [(CADGenerationStampedObjectID *)self restoreGeneration];
    int v15 = [(CADGenerationStampedObjectID *)v9 restoreGeneration];
    goto LABEL_19;
  }
  if (v7 == (Class)objc_opt_class())
  {
    v16 = v5;
    int v17 = [(CADGenerationStampedObjectID *)self entityType];
    if (v17 != [(CADGenerationStampedObjectID *)v16 entityType]
      || (int v18 = [(CADGenerationStampedObjectID *)self entityID],
          v18 != [(CADGenerationStampedObjectID *)v16 entityID])
      || (int v19 = [(CADGenerationStampedObjectID *)self isTemporary],
          v19 != [(CADGenerationStampedObjectID *)v16 isTemporary]))
    {
LABEL_15:
      BOOL v8 = 0;
LABEL_16:

      goto LABEL_17;
    }
    int v14 = [(CADGenerationStampedObjectID *)self databaseID];
    int v15 = [(CADGenerationStampedObjectID *)v16 databaseID];
LABEL_19:
    BOOL v8 = v14 == v15;
    goto LABEL_16;
  }
LABEL_5:
  BOOL v8 = 0;
LABEL_17:

  return v8;
}

- (CADGenerationStampedObjectID)initWithEntityType:(int)a3 entityID:(int)a4 databaseID:(int)a5 generation:(int)a6
{
  v8.receiver = self;
  v8.super_class = (Class)CADGenerationStampedObjectID;
  result = [(CADGenerationStampedObjectID *)&v8 initWithEntityType:*(void *)&a3 entityID:*(void *)&a4 databaseID:*(void *)&a5];
  if (result) {
    result->_restoreGeneration = a6;
  }
  return result;
}

- (int)restoreGeneration
{
  return self->_restoreGeneration;
}

- (CADGenerationStampedObjectID)initWithEntityType:(int)a3 entityID:(int)a4 generation:(int)a5
{
  return [(CADGenerationStampedObjectID *)self initWithEntityType:*(void *)&a3 entityID:*(void *)&a4 databaseID:*MEMORY[0x1E4F574B8] generation:*(void *)&a5];
}

@end