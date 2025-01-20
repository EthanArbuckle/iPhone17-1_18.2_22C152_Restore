@interface SKGNode
+ (Class)edgeClass;
+ (MANodeFilter)filter;
+ (id)inRelation;
+ (id)label;
+ (id)nodeWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4;
+ (id)outRelation;
+ (id)relation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNode:(id)a3;
- (NSString)value;
- (SKGNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
- (SKGNode)initWithValue:(id)a3;
- (float)weight;
- (id)filter;
- (id)label;
- (id)propertyDictionary;
- (unsigned)domain;
@end

@implementation SKGNode

+ (id)label
{
  return 0;
}

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

+ (MANodeFilter)filter
{
  id v3 = objc_alloc((Class)MANodeFilter);
  v4 = [a1 label];
  id v5 = [v3 initWithLabel:v4 domain:kMAElementIgnoreDomain];

  return (MANodeFilter *)v5;
}

+ (id)relation
{
  v2 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "edgeClass"), "filter");
  id v3 = [v2 anyDirectionRelation];

  return v3;
}

+ (id)inRelation
{
  v2 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "edgeClass"), "filter");
  id v3 = [v2 inRelation];

  return v3;
}

+ (id)outRelation
{
  v2 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "edgeClass"), "filter");
  id v3 = [v2 outRelation];

  return v3;
}

+ (id)nodeWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4
{
  id v5 = a4;
  v6 = [v5 graph];
  v7 = [v6 nodeForIdentifier:a3];

  v8 = [v7 label];
  unsigned int v9 = [v8 isEqualToString:off_1000F8350[0]];

  if (v9)
  {
    id v10 = +[SKGUserNode user];
  }
  else
  {
    v11 = [v7 label];
    unsigned int v12 = [v11 isEqualToString:off_1000F8358[0]];

    if (v12)
    {
      id v10 = +[SKGPersonNode personWithElementIdentifier:a3 inGraph:v5];
    }
    else
    {
      v13 = [v7 label];
      unsigned int v14 = [v13 isEqualToString:off_1000F8360[0]];

      if (v14)
      {
        id v10 = +[SKGContactNode contactWithElementIdentifier:a3 inGraph:v5];
      }
      else
      {
        v15 = [v7 label];
        unsigned int v16 = [v15 isEqualToString:off_1000F8368[0]];

        if (v16)
        {
          id v10 = +[SKGPhotoNode photoWithElementIdentifier:a3 inGraph:v5];
        }
        else
        {
          v17 = [v7 label];
          unsigned int v18 = [v17 isEqualToString:off_1000F8370[0]];

          if (v18)
          {
            id v10 = +[SKGEntityNode entityWithElementIdentifier:a3 inGraph:v5];
          }
          else
          {
            v19 = [v7 label];
            unsigned int v20 = [v19 isEqualToString:off_1000F8378[0]];

            if (v20)
            {
              id v10 = +[SKGDisplayNameNode displayNameWithElementIdentifier:a3 inGraph:v5];
            }
            else
            {
              v21 = [v7 label];
              unsigned int v22 = [v21 isEqualToString:off_1000F8380[0]];

              if (v22)
              {
                id v10 = +[SKGNameNode nameWithElementIdentifier:a3 inGraph:v5];
              }
              else
              {
                v23 = [v7 label];
                unsigned int v24 = [v23 isEqualToString:off_1000F8388[0]];

                if (v24)
                {
                  id v10 = +[SKGNameKeyNode nameKeyWithElementIdentifier:a3 inGraph:v5];
                }
                else
                {
                  v25 = [v7 label];
                  unsigned int v26 = [v25 isEqualToString:off_1000F8390[0]];

                  if (v26)
                  {
                    id v10 = +[SKGEmailNode emailWithElementIdentifier:a3 inGraph:v5];
                  }
                  else
                  {
                    v27 = [v7 label];
                    unsigned int v28 = [v27 isEqualToString:off_1000F8398[0]];

                    if (v28)
                    {
                      id v10 = +[SKGPhoneNode phoneWithElementIdentifier:a3 inGraph:v5];
                    }
                    else
                    {
                      v29 = [v7 label];
                      unsigned int v30 = [v29 isEqualToString:off_1000F83A0[0]];

                      if (v30)
                      {
                        id v10 = +[SKGReferenceNode referenceWithElementIdentifier:a3 inGraph:v5];
                      }
                      else
                      {
                        v31 = [v7 label];
                        unsigned int v32 = [v31 isEqualToString:off_1000F83A8[0]];

                        if (v32)
                        {
                          id v10 = +[SKGPersonaNode personaWithElementIdentifier:a3 inGraph:v5];
                        }
                        else
                        {
                          v33 = [v7 label];
                          unsigned int v34 = [v33 isEqualToString:off_1000F83B0];

                          if (v34)
                          {
                            id v10 = +[SKGDomainNode domainWithElementIdentifier:a3 inGraph:v5];
                          }
                          else
                          {
                            id v10 = v7;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v35 = v10;

  return v35;
}

- (SKGNode)initWithValue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKGNode;
  id v5 = [(SKGNode *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[NSString stringWithFormat:@"%@", v4];
    value = v5->_value;
    v5->_value = (NSString *)v6;
  }
  return v5;
}

- (SKGNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  v7 = objc_msgSend(a6, "objectForKey:", @"value", a4);
  if (v7)
  {
    self = [(SKGNode *)self initWithValue:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToNode:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 label];
    v7 = [(SKGNode *)self label];
    if ([v6 isEqualToString:v7])
    {
      v8 = [v5 propertyDictionary];
      objc_super v9 = [(SKGNode *)self propertyDictionary];
      unsigned int v10 = [v8 isEqualToDictionary:v9] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 1;
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10 ^ 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SKGNode *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(SKGNode *)self isEqualToNode:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)filter
{
  if (self->_value) {
    CFStringRef value = (const __CFString *)self->_value;
  }
  else {
    CFStringRef value = &stru_1000DD7E8;
  }
  CFStringRef v9 = @"value";
  CFStringRef v10 = value;
  id v4 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v5 = objc_alloc((Class)MANodeFilter);
  uint64_t v6 = [(SKGNode *)self label];
  id v7 = objc_msgSend(v5, "initWithLabel:domain:properties:", v6, -[SKGNode domain](self, "domain"), v4);

  return v7;
}

- (id)propertyDictionary
{
  CFStringRef value = self->_value;
  if (value)
  {
    CFStringRef v5 = @"value";
    uint64_t v6 = value;
    id v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  }
  else
  {
    id v3 = &off_1000E6DD8;
  }

  return v3;
}

- (id)label
{
  v2 = objc_opt_class();

  return [v2 label];
}

- (NSString)value
{
  return self->_value;
}

- (unsigned)domain
{
  return 100;
}

- (float)weight
{
  return 1.0;
}

- (void).cxx_destruct
{
}

@end