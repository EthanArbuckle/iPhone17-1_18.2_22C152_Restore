@interface _INPBContactRelationship
+ (BOOL)supportsSecureCoding;
- (BOOL)hasName;
- (BOOL)hasRelation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
- (NSString)relation;
- (_INPBContactRelationship)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setRelation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBContactRelationship

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSString *)self->_relation hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_INPBContactRelationship *)self name];
  v6 = [v4 name];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_INPBContactRelationship *)self name];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBContactRelationship *)self name];
    v10 = [v4 name];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_INPBContactRelationship *)self relation];
  v6 = [v4 relation];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_INPBContactRelationship *)self relation];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(_INPBContactRelationship *)self relation];
    v15 = [v4 relation];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)setRelation:(id)a3
{
  self->_relation = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relation, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)relation
{
  return self->_relation;
}

- (NSString)name
{
  return self->_name;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_name)
  {
    id v4 = [(_INPBContactRelationship *)self name];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"name"];
  }
  if (self->_relation)
  {
    v6 = [(_INPBContactRelationship *)self relation];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"relation"];
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[_INPBContactRelationship allocWithZone:](_INPBContactRelationship, "allocWithZone:") init];
  v6 = (void *)[(NSString *)self->_name copyWithZone:a3];
  [(_INPBContactRelationship *)v5 setName:v6];

  uint64_t v7 = (void *)[(NSString *)self->_relation copyWithZone:a3];
  [(_INPBContactRelationship *)v5 setRelation:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBContactRelationship *)self data];
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBContactRelationship)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBContactRelationship *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBContactRelationship *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBContactRelationship *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_INPBContactRelationship *)self name];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(_INPBContactRelationship *)self relation];

  if (v5) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBContactRelationshipReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasRelation
{
  return self->_relation != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  name = self->_name;
  self->_name = v4;

  MEMORY[0x1F41817F8](v4, name);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end