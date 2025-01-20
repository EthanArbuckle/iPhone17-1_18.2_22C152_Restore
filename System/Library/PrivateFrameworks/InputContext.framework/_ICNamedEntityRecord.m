@interface _ICNamedEntityRecord
- (BOOL)passesFilters;
- (NSString)name;
- (_ICNamedEntityRecord)initWithName:(id)a3;
- (_ICNamedEntityRecord)initWithName:(id)a3 data:(unint64_t)a4;
- (_ICNamedEntityRecord)initWithName:(id)a3 timestamp:(double)a4 passesFilters:(BOOL)a5;
- (double)timestamp;
- (id)description;
- (unint64_t)data;
@end

@implementation _ICNamedEntityRecord

- (_ICNamedEntityRecord)initWithName:(id)a3 data:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_ICNamedEntityRecord;
  v7 = [(_ICNamedEntityRecord *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_data = a4;
    v7->_timestamp = CFAbsoluteTimeGetCurrent();
    v7->_passesFilters = 1;
    v10 = v7;
  }

  return v7;
}

- (_ICNamedEntityRecord)initWithName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_ICNamedEntityRecord;
  v5 = [(_ICNamedEntityRecord *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v5->_timestamp = CFAbsoluteTimeGetCurrent();
    v5->_passesFilters = 1;
    uint64_t v8 = v5;
  }

  return v5;
}

- (_ICNamedEntityRecord)initWithName:(id)a3 timestamp:(double)a4 passesFilters:(BOOL)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_ICNamedEntityRecord;
  v9 = [(_ICNamedEntityRecord *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    name = v9->_name;
    v9->_name = (NSString *)v10;

    v9->_timestamp = a4;
    v9->_passesFilters = a5;
    objc_super v12 = v9;
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; name=\"%@\", data=%llu, passesFilters=%d>",
               objc_opt_class(),
               self,
               self->_name,
               self->_data,
               self->_passesFilters);
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)data
{
  return self->_data;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)passesFilters
{
  return self->_passesFilters;
}

- (void).cxx_destruct
{
}

@end