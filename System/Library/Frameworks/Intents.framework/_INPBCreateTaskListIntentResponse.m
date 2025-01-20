@interface _INPBCreateTaskListIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCreatedTaskList;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBCreateTaskListIntentResponse)initWithCoder:(id)a3;
- (_INPBTaskList)createdTaskList;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCreatedTaskList:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBCreateTaskListIntentResponse

- (void).cxx_destruct
{
}

- (_INPBTaskList)createdTaskList
{
  return self->_createdTaskList;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBCreateTaskListIntentResponse *)self createdTaskList];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"createdTaskList"];

  return v3;
}

- (unint64_t)hash
{
  return [(_INPBTaskList *)self->_createdTaskList hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_INPBCreateTaskListIntentResponse *)self createdTaskList];
    v6 = [v4 createdTaskList];
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_INPBCreateTaskListIntentResponse *)self createdTaskList];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_INPBCreateTaskListIntentResponse *)self createdTaskList];
      v11 = [v4 createdTaskList];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBCreateTaskListIntentResponse allocWithZone:](_INPBCreateTaskListIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBTaskList *)self->_createdTaskList copyWithZone:a3];
  [(_INPBCreateTaskListIntentResponse *)v5 setCreatedTaskList:v6];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBCreateTaskListIntentResponse *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBCreateTaskListIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBCreateTaskListIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBCreateTaskListIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBCreateTaskListIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBCreateTaskListIntentResponse *)self createdTaskList];

  if (v4)
  {
    v5 = [(_INPBCreateTaskListIntentResponse *)self createdTaskList];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateTaskListIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasCreatedTaskList
{
  return self->_createdTaskList != 0;
}

- (void)setCreatedTaskList:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end