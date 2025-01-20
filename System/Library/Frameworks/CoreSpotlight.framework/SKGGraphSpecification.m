@interface SKGGraphSpecification
- (Class)edgeClassWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (Class)nodeClassWithLabel:(id)a3 domain:(unsigned __int16)a4;
- (SKGGraphSpecification)init;
@end

@implementation SKGGraphSpecification

- (SKGGraphSpecification)init
{
  v4.receiver = self;
  v4.super_class = (Class)SKGGraphSpecification;
  v2 = [(SKGGraphSpecification *)&v4 init];
  if (v2)
  {
    [(SKGGraphSpecification *)v2 setDefaultNodeClass:objc_opt_class()];
    [(SKGGraphSpecification *)v2 setDefaultEdgeClass:objc_opt_class()];
  }
  return v2;
}

- (Class)nodeClassWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  id v4 = a3;
  v5 = +[SKGUserNode label];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v7 = +[SKGPersonNode label];
    unsigned __int8 v8 = [v4 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      v9 = +[SKGContactNode label];
      unsigned __int8 v10 = [v4 isEqual:v9];

      if ((v10 & 1) == 0)
      {
        v11 = +[SKGPhotoNode label];
        unsigned __int8 v12 = [v4 isEqual:v11];

        if ((v12 & 1) == 0)
        {
          v13 = +[SKGEntityNode label];
          unsigned __int8 v14 = [v4 isEqual:v13];

          if ((v14 & 1) == 0)
          {
            v15 = +[SKGDisplayNameNode label];
            unsigned __int8 v16 = [v4 isEqual:v15];

            if ((v16 & 1) == 0)
            {
              v17 = +[SKGNameNode label];
              unsigned __int8 v18 = [v4 isEqual:v17];

              if ((v18 & 1) == 0)
              {
                v19 = +[SKGNameKeyNode label];
                unsigned __int8 v20 = [v4 isEqual:v19];

                if ((v20 & 1) == 0)
                {
                  v21 = +[SKGEmailNode label];
                  unsigned __int8 v22 = [v4 isEqual:v21];

                  if ((v22 & 1) == 0)
                  {
                    v23 = +[SKGPhoneNode label];
                    unsigned __int8 v24 = [v4 isEqual:v23];

                    if ((v24 & 1) == 0)
                    {
                      v25 = +[SKGReferenceNode label];
                      unsigned __int8 v26 = [v4 isEqual:v25];

                      if ((v26 & 1) == 0)
                      {
                        v27 = +[SKGPersonaNode label];
                        unsigned __int8 v28 = [v4 isEqual:v27];

                        if ((v28 & 1) == 0)
                        {
                          v29 = +[SKGDomainNode label];
                          [v4 isEqual:v29];
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
  v30 = objc_opt_class();

  return (Class)v30;
}

- (Class)edgeClassWithLabel:(id)a3 domain:(unsigned __int16)a4
{
  id v4 = a3;
  v5 = +[SKGUserEdge name];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    v7 = +[SKGPersonEdge name];
    unsigned __int8 v8 = [v4 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      v9 = +[SKGContactEdge name];
      unsigned __int8 v10 = [v4 isEqual:v9];

      if ((v10 & 1) == 0)
      {
        v11 = +[SKGPhotoEdge name];
        unsigned __int8 v12 = [v4 isEqual:v11];

        if ((v12 & 1) == 0)
        {
          v13 = +[SKGEntityEdge name];
          unsigned __int8 v14 = [v4 isEqual:v13];

          if ((v14 & 1) == 0)
          {
            v15 = +[SKGDisplayNameEdge name];
            unsigned __int8 v16 = [v4 isEqual:v15];

            if ((v16 & 1) == 0)
            {
              v17 = +[SKGNameEdge name];
              unsigned __int8 v18 = [v4 isEqual:v17];

              if ((v18 & 1) == 0)
              {
                v19 = +[SKGNameKeyEdge name];
                unsigned __int8 v20 = [v4 isEqual:v19];

                if ((v20 & 1) == 0)
                {
                  v21 = +[SKGEmailEdge name];
                  unsigned __int8 v22 = [v4 isEqual:v21];

                  if ((v22 & 1) == 0)
                  {
                    v23 = +[SKGPhoneEdge name];
                    unsigned __int8 v24 = [v4 isEqual:v23];

                    if ((v24 & 1) == 0)
                    {
                      v25 = +[SKGReferenceEdge name];
                      unsigned __int8 v26 = [v4 isEqual:v25];

                      if ((v26 & 1) == 0)
                      {
                        v27 = +[SKGPersonaEdge name];
                        unsigned __int8 v28 = [v4 isEqual:v27];

                        if ((v28 & 1) == 0)
                        {
                          v29 = +[SKGDomainEdge name];
                          [v4 isEqual:v29];
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
  v30 = objc_opt_class();

  return (Class)v30;
}

@end