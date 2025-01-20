@interface SKGEdge
+ (Class)nodeClass;
+ (MAEdgeFilter)filter;
+ (id)edgeFromNode:(id)a3 toNode:(id)a4;
+ (id)edgeWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4;
+ (id)name;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEdge:(id)a3;
- (NSNumber)score;
- (SKGEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8;
- (SKGEdge)initWithSourceNode:(id)a3 targetNode:(id)a4;
- (float)weight;
- (id)label;
- (id)propertyDictionary;
- (unsigned)domain;
@end

@implementation SKGEdge

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)name
{
  return @"unknown";
}

+ (MAEdgeFilter)filter
{
  id v2 = objc_alloc((Class)MAEdgeFilter);
  v3 = [(id)objc_opt_class() name];
  id v4 = [v2 initWithLabel:v3 domain:100];

  return (MAEdgeFilter *)v4;
}

+ (id)edgeWithElementIdentifier:(unint64_t)a3 inGraph:(id)a4
{
  id v5 = a4;
  v6 = [v5 graph];
  v7 = [v6 edgeForIdentifier:a3];

  if (!v7)
  {
    v12 = 0;
    goto LABEL_36;
  }
  v8 = [v7 sourceNode];
  v9 = +[SKGNode nodeWithElementIdentifier:inGraph:](SKGNode, "nodeWithElementIdentifier:inGraph:", [v8 identifier], v5);

  v10 = [v7 targetNode];
  v11 = +[SKGNode nodeWithElementIdentifier:inGraph:](SKGNode, "nodeWithElementIdentifier:inGraph:", [v10 identifier], v5);

  v12 = 0;
  if (v9 && v11)
  {
    v13 = [v7 label];
    unsigned __int8 v14 = [v13 isEqualToString:off_1000F8350[0]];

    if (v14)
    {
      v15 = off_1000D9308;
LABEL_34:
      v12 = (SKGInteractionEdge *)[objc_alloc(*v15) initWithSourceNode:v9 targetNode:v11];
      goto LABEL_35;
    }
    v16 = [v7 label];
    unsigned __int8 v17 = [v16 isEqualToString:off_1000F8358[0]];

    if (v17)
    {
      v15 = off_1000D92B8;
      goto LABEL_34;
    }
    v18 = [v7 label];
    unsigned __int8 v19 = [v18 isEqualToString:off_1000F8360[0]];

    if (v19)
    {
      v15 = off_1000D9230;
      goto LABEL_34;
    }
    v20 = [v7 label];
    unsigned __int8 v21 = [v20 isEqualToString:off_1000F8368[0]];

    if (v21)
    {
      v15 = off_1000D92E8;
      goto LABEL_34;
    }
    v22 = [v7 label];
    unsigned __int8 v23 = [v22 isEqualToString:off_1000F8370[0]];

    if (v23)
    {
      v15 = off_1000D9278;
      goto LABEL_34;
    }
    v24 = [v7 label];
    unsigned __int8 v25 = [v24 isEqualToString:off_1000F8378[0]];

    if (v25)
    {
      v15 = off_1000D9240;
      goto LABEL_34;
    }
    v26 = [v7 label];
    unsigned __int8 v27 = [v26 isEqualToString:off_1000F8380[0]];

    if (v27)
    {
      v15 = off_1000D9290;
      goto LABEL_34;
    }
    v28 = [v7 label];
    unsigned __int8 v29 = [v28 isEqualToString:off_1000F8388[0]];

    if (v29)
    {
      v15 = off_1000D9298;
      goto LABEL_34;
    }
    v30 = [v7 label];
    unsigned __int8 v31 = [v30 isEqualToString:off_1000F8390[0]];

    if (v31)
    {
      v15 = off_1000D9268;
      goto LABEL_34;
    }
    v32 = [v7 label];
    unsigned __int8 v33 = [v32 isEqualToString:off_1000F8398[0]];

    if (v33)
    {
      v15 = off_1000D92D8;
      goto LABEL_34;
    }
    v34 = [v7 label];
    unsigned __int8 v35 = [v34 isEqualToString:off_1000F83A0[0]];

    if (v35)
    {
      v15 = off_1000D92F8;
      goto LABEL_34;
    }
    v36 = [v7 label];
    unsigned __int8 v37 = [v36 isEqualToString:off_1000F83A8[0]];

    if (v37)
    {
      v15 = off_1000D92C8;
      goto LABEL_34;
    }
    v38 = [v7 label];
    unsigned __int8 v39 = [v38 isEqualToString:off_1000F83B0];

    if (v39)
    {
      v15 = off_1000D9250;
      goto LABEL_34;
    }
    v40 = [v7 label];
    v41 = +[SKGEdge name];
    unsigned int v42 = [v40 isEqualToString:v41];

    if (!v42)
    {
      v15 = off_1000D9260;
      goto LABEL_34;
    }
    id v43 = v7;
    v44 = [SKGInteractionEdge alloc];
    v45 = [v43 domainIdentifier];
    v46 = [v43 relationship];
    v47 = [v43 score];
    v12 = [(SKGInteractionEdge *)v44 initWithSourceNode:v9 targetNode:v11 domainIdentifier:v45 relationship:v46 score:v47];
  }
LABEL_35:

LABEL_36:

  return v12;
}

+ (id)edgeFromNode:(id)a3 toNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[SKGUserEdge edgeFromUser:v5 toNode:v6];
LABEL_27:
    v8 = (void *)v7;
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[SKGPersonEdge edgeFromPerson:v5 toNode:v6];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[SKGContactEdge edgeFromContact:v5 toNode:v6];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[SKGPhotoEdge edgeFromPhoto:v5 toNode:v6];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[SKGEntityEdge edgeFromEntity:v5 toNode:v6];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[SKGDisplayNameEdge edgeFromDisplayName:v5 toNode:v6];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[SKGNameEdge edgeFromName:v5 toNode:v6];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[SKGNameKeyEdge edgeFromNameKey:v5 toNode:v6];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[SKGEmailEdge edgeFromEmail:v5 toNode:v6];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[SKGPhoneEdge edgeFromPhone:v5 toNode:v6];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[SKGReferenceEdge edgeFromReference:v5 toNode:v6];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[SKGPersonaEdge edgeFromPersona:v5 toNode:v6];
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = +[SKGDomainEdge edgeFromDomain:v5 toNode:v6];
    goto LABEL_27;
  }
  v8 = 0;
LABEL_28:

  return v8;
}

- (SKGEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 weight:(float)a7 properties:(id)a8
{
  id v11 = a4;
  id v12 = a5;
  v13 = [a8 objectForKey:@"relationship"];
  if (v13)
  {
    v16.receiver = self;
    v16.super_class = (Class)SKGEdge;
    self = [(SKGEdge *)&v16 initWithSourceNode:v11 targetNode:v12];
    unsigned __int8 v14 = self;
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (SKGEdge)initWithSourceNode:(id)a3 targetNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SKGEdge;
  return [(SKGEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

- (BOOL)isEqualToEdge:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  id v6 = [v4 label];
  uint64_t v7 = [(SKGEdge *)self label];
  if (([v6 isEqualToString:v7] & 1) == 0) {
    goto LABEL_7;
  }
  v8 = [v5 propertyDictionary];
  v9 = [(SKGEdge *)self propertyDictionary];
  unsigned __int8 v10 = [v8 isEqualToDictionary:v9];

  if ((v10 & 1) == 0)
  {
LABEL_8:
    BOOL v14 = 0;
    goto LABEL_9;
  }
  id v6 = [v5 sourceNode];
  uint64_t v7 = [(SKGEdge *)self sourceNode];
  if (([v6 isEqualToNode:v7] & 1) == 0)
  {
LABEL_7:

    goto LABEL_8;
  }
  id v11 = [v5 targetNode];
  id v12 = [(SKGEdge *)self targetNode];
  unsigned __int8 v13 = [v11 isEqualToNode:v12];

  if ((v13 & 1) == 0) {
    goto LABEL_8;
  }
  BOOL v14 = 1;
LABEL_9:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SKGEdge *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(SKGEdge *)self isEqualToEdge:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (id)propertyDictionary
{
  v7[0] = @"relationship";
  v3 = [(SKGEdge *)self label];
  v7[1] = @"score";
  v8[0] = v3;
  id v4 = [(SKGEdge *)self score];
  v8[1] = v4;
  BOOL v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (NSNumber)score
{
  return (NSNumber *)&off_1000E75D8;
}

- (id)label
{
  id v2 = objc_opt_class();

  return [v2 name];
}

- (unsigned)domain
{
  return 100;
}

- (float)weight
{
  return 1.0;
}

@end