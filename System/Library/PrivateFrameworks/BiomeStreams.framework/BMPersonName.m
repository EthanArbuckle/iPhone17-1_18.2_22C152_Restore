@interface BMPersonName
- (BMNameComponents)nameComponents;
- (BMPersonName)initWithName:(id)a3 nameComponents:(id)a4;
- (BMPersonName)initWithProto:(id)a3;
- (BMPersonName)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (id)encodeAsProto;
- (id)proto;
@end

@implementation BMPersonName

- (BMPersonName)initWithName:(id)a3 nameComponents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMPersonName;
  v9 = [(BMPersonName *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_nameComponents, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = self->_nameComponents == 0;
    id v7 = [v5 nameComponents];
    int v8 = v7 != 0;

    if (v6 == v8) {
      goto LABEL_8;
    }
    if (!self->_nameComponents) {
      goto LABEL_6;
    }
    v9 = [v5 nameComponents];

    if (!v9) {
      goto LABEL_6;
    }
    nameComponents = self->_nameComponents;
    v11 = [v5 nameComponents];
    LODWORD(nameComponents) = [(BMNameComponents *)nameComponents isEqual:v11];

    if (!nameComponents)
    {
LABEL_8:
      BOOL v14 = 0;
    }
    else
    {
LABEL_6:
      name = self->_name;
      v13 = [v5 name];
      BOOL v14 = [(NSString *)name isEqualToString:v13];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)encodeAsProto
{
  v2 = [(BMPersonName *)self proto];
  v3 = [v2 data];

  return v3;
}

- (BMPersonName)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    int v6 = [BMNameComponents alloc];
    id v7 = [v5 nameComponents];
    int v8 = [(BMNameComponents *)v6 initWithProto:v7];

    v9 = [v5 name];

    self = [(BMPersonName *)self initWithName:v9 nameComponents:v8];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BMPersonName)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBPersonName alloc] initWithData:v4];

    self = [(BMPersonName *)self initWithProto:v5];
    int v6 = self;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = [(BMPersonName *)self name];
  [v3 setName:v4];

  id v5 = [(BMPersonName *)self nameComponents];

  if (v5)
  {
    int v6 = [(BMPersonName *)self nameComponents];
    id v7 = [v6 proto];

    [v3 setNameComponents:v7];
  }

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (BMNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end