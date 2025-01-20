@interface ADDeviceSyncIncrementalChange
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncIncrementalChange)init;
- (ADDeviceSyncIncrementalChange)initWithBuilder:(id)a3;
- (ADDeviceSyncIncrementalChange)initWithCoder:(id)a3;
- (ADDeviceSyncIncrementalChange)initWithGeneration:(unint64_t)a3 date:(id)a4 insertedOrUpdatedItems:(id)a5 deletedItemUUIDs:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)deletedItemUUIDs;
- (NSArray)insertedOrUpdatedItems;
- (NSDate)date;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)generation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncIncrementalChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedItemUUIDs, 0);
  objc_storeStrong((id *)&self->_insertedOrUpdatedItems, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (NSArray)deletedItemUUIDs
{
  return self->_deletedItemUUIDs;
}

- (NSArray)insertedOrUpdatedItems
{
  return self->_insertedOrUpdatedItems;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t generation = self->_generation;
  id v6 = a3;
  v5 = +[NSNumber numberWithUnsignedLongLong:generation];
  [v6 encodeObject:v5 forKey:@"ADDeviceSyncIncrementalChange::generation"];

  [v6 encodeObject:self->_date forKey:@"ADDeviceSyncIncrementalChange::date"];
  [v6 encodeObject:self->_insertedOrUpdatedItems forKey:@"ADDeviceSyncIncrementalChange::insertedOrUpdatedItems"];
  [v6 encodeObject:self->_deletedItemUUIDs forKey:@"ADDeviceSyncIncrementalChange::deletedItemUUIDs"];
}

- (ADDeviceSyncIncrementalChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncIncrementalChange::generation"];
  id v6 = [v5 unsignedLongLongValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncIncrementalChange::date"];
  uint64_t v8 = objc_opt_class();
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"ADDeviceSyncIncrementalChange::insertedOrUpdatedItems"];

  uint64_t v11 = objc_opt_class();
  v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"ADDeviceSyncIncrementalChange::deletedItemUUIDs"];

  v14 = [(ADDeviceSyncIncrementalChange *)self initWithGeneration:v6 date:v7 insertedOrUpdatedItems:v10 deletedItemUUIDs:v13];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceSyncIncrementalChange *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id generation = self->_generation;
      if (generation == (id)[(ADDeviceSyncIncrementalChange *)v5 generation])
      {
        v7 = [(ADDeviceSyncIncrementalChange *)v5 date];
        date = self->_date;
        if (date == v7 || [(NSDate *)date isEqual:v7])
        {
          v9 = [(ADDeviceSyncIncrementalChange *)v5 insertedOrUpdatedItems];
          insertedOrUpdatedItems = self->_insertedOrUpdatedItems;
          if (insertedOrUpdatedItems == v9 || [(NSArray *)insertedOrUpdatedItems isEqual:v9])
          {
            uint64_t v11 = [(ADDeviceSyncIncrementalChange *)v5 deletedItemUUIDs];
            deletedItemUUIDs = self->_deletedItemUUIDs;
            BOOL v13 = deletedItemUUIDs == v11 || [(NSArray *)deletedItemUUIDs isEqual:v11];
          }
          else
          {
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = +[NSNumber numberWithUnsignedLongLong:self->_generation];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = (unint64_t)[(NSDate *)self->_date hash];
  unint64_t v6 = v5 ^ (unint64_t)[(NSArray *)self->_insertedOrUpdatedItems hash];
  unint64_t v7 = v6 ^ (unint64_t)[(NSArray *)self->_deletedItemUUIDs hash] ^ v4;

  return v7;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADDeviceSyncIncrementalChange;
  unint64_t v5 = [(ADDeviceSyncIncrementalChange *)&v8 description];
  v6 = [v4 initWithFormat:@"%@ {id generation = %llu, date = %@, insertedOrUpdatedItems = %@, deletedItemUUIDs = %@}", v5, self->_generation, self->_date, self->_insertedOrUpdatedItems, self->_deletedItemUUIDs];

  return v6;
}

- (id)description
{
  return [(ADDeviceSyncIncrementalChange *)self _descriptionWithIndent:0];
}

- (ADDeviceSyncIncrementalChange)initWithGeneration:(unint64_t)a3 date:(id)a4 insertedOrUpdatedItems:(id)a5 deletedItemUUIDs:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100268F84;
  v15[3] = &unk_1005083D8;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  unint64_t v19 = a3;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  BOOL v13 = [(ADDeviceSyncIncrementalChange *)self initWithBuilder:v15];

  return v13;
}

- (ADDeviceSyncIncrementalChange)init
{
  return [(ADDeviceSyncIncrementalChange *)self initWithBuilder:0];
}

- (ADDeviceSyncIncrementalChange)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncIncrementalChangeMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)ADDeviceSyncIncrementalChange;
  unint64_t v5 = [(ADDeviceSyncIncrementalChange *)&v18 init];
  id v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_ADDeviceSyncIncrementalChangeMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADDeviceSyncIncrementalChangeMutation *)v7 isDirty])
    {
      v6->_id generation = [(_ADDeviceSyncIncrementalChangeMutation *)v7 getGeneration];
      objc_super v8 = [(_ADDeviceSyncIncrementalChangeMutation *)v7 getDate];
      v9 = (NSDate *)[v8 copy];
      date = v6->_date;
      v6->_date = v9;

      id v11 = [(_ADDeviceSyncIncrementalChangeMutation *)v7 getInsertedOrUpdatedItems];
      id v12 = (NSArray *)[v11 copy];
      insertedOrUpdatedItems = v6->_insertedOrUpdatedItems;
      v6->_insertedOrUpdatedItems = v12;

      v14 = [(_ADDeviceSyncIncrementalChangeMutation *)v7 getDeletedItemUUIDs];
      v15 = (NSArray *)[v14 copy];
      deletedItemUUIDs = v6->_deletedItemUUIDs;
      v6->_deletedItemUUIDs = v15;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncIncrementalChangeMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_ADDeviceSyncIncrementalChangeMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADDeviceSyncIncrementalChangeMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADDeviceSyncIncrementalChange);
      v6->_id generation = [(_ADDeviceSyncIncrementalChangeMutation *)v5 getGeneration];
      unint64_t v7 = [(_ADDeviceSyncIncrementalChangeMutation *)v5 getDate];
      objc_super v8 = (NSDate *)[v7 copy];
      date = v6->_date;
      v6->_date = v8;

      id v10 = [(_ADDeviceSyncIncrementalChangeMutation *)v5 getInsertedOrUpdatedItems];
      id v11 = (NSArray *)[v10 copy];
      insertedOrUpdatedItems = v6->_insertedOrUpdatedItems;
      v6->_insertedOrUpdatedItems = v11;

      BOOL v13 = [(_ADDeviceSyncIncrementalChangeMutation *)v5 getDeletedItemUUIDs];
      v14 = (NSArray *)[v13 copy];
      deletedItemUUIDs = v6->_deletedItemUUIDs;
      v6->_deletedItemUUIDs = v14;
    }
    else
    {
      id v6 = (ADDeviceSyncIncrementalChange *)[(ADDeviceSyncIncrementalChange *)self copy];
    }
  }
  else
  {
    id v6 = (ADDeviceSyncIncrementalChange *)[(ADDeviceSyncIncrementalChange *)self copy];
  }

  return v6;
}

@end