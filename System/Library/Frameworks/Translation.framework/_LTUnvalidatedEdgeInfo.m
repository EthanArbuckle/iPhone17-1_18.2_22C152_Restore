@interface _LTUnvalidatedEdgeInfo
+ (id)genderEdgeInfoWithTargetPhraseIndex:(unint64_t)a3 targetLinkIndex:(unint64_t)a4 gender:(unint64_t)a5 defaultGender:(unint64_t)a6;
+ (id)meaningEdgeInfoWithTargetPhraseIndex:(unint64_t)a3 targetLinkIndex:(unint64_t)a4 meaningDescription:(id)a5;
- (NSNumber)defaultGender;
- (NSNumber)targetGender;
- (NSString)meaningDescription;
- (id)_initWithTargetPhraseIndex:(unint64_t)a3 targetLinkIndex:(unint64_t)a4 type:(unint64_t)a5 meaningDescription:(id)a6 gender:(id)a7 defaultGender:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)targetLinkIndex;
- (unint64_t)targetPhraseIndex;
- (unint64_t)type;
@end

@implementation _LTUnvalidatedEdgeInfo

+ (id)meaningEdgeInfoWithTargetPhraseIndex:(unint64_t)a3 targetLinkIndex:(unint64_t)a4 meaningDescription:(id)a5
{
  id v8 = a5;
  v9 = (void *)[objc_alloc((Class)a1) _initWithTargetPhraseIndex:a3 targetLinkIndex:a4 type:0 meaningDescription:v8 gender:0 defaultGender:0];

  return v9;
}

+ (id)genderEdgeInfoWithTargetPhraseIndex:(unint64_t)a3 targetLinkIndex:(unint64_t)a4 gender:(unint64_t)a5 defaultGender:(unint64_t)a6
{
  id v10 = objc_alloc((Class)a1);
  v11 = [NSNumber numberWithUnsignedInteger:a5];
  v12 = [NSNumber numberWithUnsignedInteger:a6];
  v13 = (void *)[v10 _initWithTargetPhraseIndex:a3 targetLinkIndex:a4 type:1 meaningDescription:0 gender:v11 defaultGender:v12];

  return v13;
}

- (id)_initWithTargetPhraseIndex:(unint64_t)a3 targetLinkIndex:(unint64_t)a4 type:(unint64_t)a5 meaningDescription:(id)a6 gender:(id)a7 defaultGender:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v23.receiver = self;
  v23.super_class = (Class)_LTUnvalidatedEdgeInfo;
  v17 = [(_LTUnvalidatedEdgeInfo *)&v23 init];
  v18 = v17;
  if (v17)
  {
    v17->_type = a5;
    v17->_targetPhraseIndex = a3;
    v17->_targetLinkIndex = a4;
    uint64_t v19 = [v14 copy];
    meaningDescription = v18->_meaningDescription;
    v18->_meaningDescription = (NSString *)v19;

    objc_storeStrong((id *)&v18->_targetGender, a7);
    objc_storeStrong((id *)&v18->_defaultGender, a8);
    v21 = v18;
  }

  return v18;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = _LTDisambiguationTypeDescription([(_LTUnvalidatedEdgeInfo *)self type]);
  unint64_t v7 = [(_LTUnvalidatedEdgeInfo *)self targetPhraseIndex];
  unint64_t v8 = [(_LTUnvalidatedEdgeInfo *)self targetLinkIndex];
  v9 = [(_LTUnvalidatedEdgeInfo *)self targetGender];
  id v10 = [(_LTUnvalidatedEdgeInfo *)self defaultGender];
  v11 = [(_LTUnvalidatedEdgeInfo *)self meaningDescription];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; type: %@; targetIndex: %zu; linkIndex: %zu; gender: %@; defaultGender: %@; menuDescription: %@>",
    v5,
    self,
    v6,
    v7,
    v8,
    v9,
    v10,
  v12 = v11);

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t targetPhraseIndex = self->_targetPhraseIndex;
  unint64_t targetLinkIndex = self->_targetLinkIndex;
  unint64_t type = self->_type;
  unint64_t v8 = (void *)[(NSString *)self->_meaningDescription copy];
  v9 = (void *)[(NSNumber *)self->_targetGender copy];
  id v10 = (void *)[(NSNumber *)self->_defaultGender copy];
  v11 = (void *)[v4 _initWithTargetPhraseIndex:targetPhraseIndex targetLinkIndex:targetLinkIndex type:type meaningDescription:v8 gender:v9 defaultGender:v10];

  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)targetPhraseIndex
{
  return self->_targetPhraseIndex;
}

- (unint64_t)targetLinkIndex
{
  return self->_targetLinkIndex;
}

- (NSNumber)targetGender
{
  return self->_targetGender;
}

- (NSNumber)defaultGender
{
  return self->_defaultGender;
}

- (NSString)meaningDescription
{
  return self->_meaningDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningDescription, 0);
  objc_storeStrong((id *)&self->_defaultGender, 0);

  objc_storeStrong((id *)&self->_targetGender, 0);
}

@end