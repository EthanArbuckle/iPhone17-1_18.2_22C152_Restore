@interface ADDeviceSyncSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncSnapshot)init;
- (ADDeviceSyncSnapshot)initWithBuilder:(id)a3;
- (ADDeviceSyncSnapshot)initWithCoder:(id)a3;
- (ADDeviceSyncSnapshot)initWithGeneration:(unint64_t)a3 date:(id)a4 items:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (NSDate)date;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)generation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncSnapshot

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (NSArray)items
{
  return self->_items;
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
  [v6 encodeObject:v5 forKey:@"ADDeviceSyncSnapshot::generation"];

  [v6 encodeObject:self->_date forKey:@"ADDeviceSyncSnapshot::date"];
  [v6 encodeObject:self->_items forKey:@"ADDeviceSyncSnapshot::items"];
}

- (ADDeviceSyncSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncSnapshot::generation"];
  id v6 = [v5 unsignedLongLongValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncSnapshot::date"];
  uint64_t v8 = objc_opt_class();
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"ADDeviceSyncSnapshot::items"];

  v11 = [(ADDeviceSyncSnapshot *)self initWithGeneration:v6 date:v7 items:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceSyncSnapshot *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id generation = self->_generation;
      if (generation == (id)[(ADDeviceSyncSnapshot *)v5 generation])
      {
        v7 = [(ADDeviceSyncSnapshot *)v5 date];
        date = self->_date;
        if (date == v7 || [(NSDate *)date isEqual:v7])
        {
          v9 = [(ADDeviceSyncSnapshot *)v5 items];
          items = self->_items;
          BOOL v11 = items == v9 || [(NSArray *)items isEqual:v9];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = +[NSNumber numberWithUnsignedLongLong:self->_generation];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = (unint64_t)[(NSDate *)self->_date hash];
  unint64_t v6 = v5 ^ (unint64_t)[(NSArray *)self->_items hash] ^ v4;

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADDeviceSyncSnapshot;
  unint64_t v5 = [(ADDeviceSyncSnapshot *)&v8 description];
  v6 = [v4 initWithFormat:@"%@ {id generation = %llu, date = %@, items = %@}", v5, self->_generation, self->_date, self->_items];

  return v6;
}

- (id)description
{
  return [(ADDeviceSyncSnapshot *)self _descriptionWithIndent:0];
}

- (ADDeviceSyncSnapshot)initWithGeneration:(unint64_t)a3 date:(id)a4 items:(id)a5
{
  id v8 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100081678;
  v13[3] = &unk_1004FFF30;
  id v15 = a5;
  unint64_t v16 = a3;
  id v14 = v8;
  id v9 = v15;
  id v10 = v8;
  BOOL v11 = [(ADDeviceSyncSnapshot *)self initWithBuilder:v13];

  return v11;
}

- (ADDeviceSyncSnapshot)init
{
  return [(ADDeviceSyncSnapshot *)self initWithBuilder:0];
}

- (ADDeviceSyncSnapshot)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncSnapshotMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)ADDeviceSyncSnapshot;
  unint64_t v5 = [(ADDeviceSyncSnapshot *)&v15 init];
  id v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_ADDeviceSyncSnapshotMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADDeviceSyncSnapshotMutation *)v7 isDirty])
    {
      v6->_id generation = [(_ADDeviceSyncSnapshotMutation *)v7 getGeneration];
      id v8 = [(_ADDeviceSyncSnapshotMutation *)v7 getDate];
      id v9 = (NSDate *)[v8 copy];
      date = v6->_date;
      v6->_date = v9;

      BOOL v11 = [(_ADDeviceSyncSnapshotMutation *)v7 getItems];
      v12 = (NSArray *)[v11 copy];
      items = v6->_items;
      v6->_items = v12;
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
  id v4 = (void (**)(id, _ADDeviceSyncSnapshotMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_ADDeviceSyncSnapshotMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADDeviceSyncSnapshotMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADDeviceSyncSnapshot);
      v6->_id generation = [(_ADDeviceSyncSnapshotMutation *)v5 getGeneration];
      v7 = [(_ADDeviceSyncSnapshotMutation *)v5 getDate];
      id v8 = (NSDate *)[v7 copy];
      date = v6->_date;
      v6->_date = v8;

      id v10 = [(_ADDeviceSyncSnapshotMutation *)v5 getItems];
      BOOL v11 = (NSArray *)[v10 copy];
      items = v6->_items;
      v6->_items = v11;
    }
    else
    {
      id v6 = (ADDeviceSyncSnapshot *)[(ADDeviceSyncSnapshot *)self copy];
    }
  }
  else
  {
    id v6 = (ADDeviceSyncSnapshot *)[(ADDeviceSyncSnapshot *)self copy];
  }

  return v6;
}

@end