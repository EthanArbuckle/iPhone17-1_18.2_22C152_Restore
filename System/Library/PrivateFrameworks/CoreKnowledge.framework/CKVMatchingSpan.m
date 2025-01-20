@interface CKVMatchingSpan
+ (BOOL)supportsSecureCoding;
+ (id)_extractOntologyLabelFromGraph:(id)a3;
+ (id)matchingSpanFromSpanMatchResult:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMatchingSpan:(id)a3;
- (CKVMatchingSpan)init;
- (CKVMatchingSpan)initWithCoder:(id)a3;
- (CKVMatchingSpan)initWithOntologyGraph:(id)a3 ontologyLabel:(id)a4 semanticValue:(id)a5 beginIndex:(unint64_t)a6 endIndex:(unint64_t)a7 itemId:(id)a8 originAppId:(id)a9 score:(float)a10 matchScore:(float)a11 priorInfo:(id)a12;
- (CKVMatchingSpanMetadata)metadata;
- (NSString)itemId;
- (NSString)ontologyLabel;
- (NSString)originAppId;
- (NSString)semanticValue;
- (USOGraph)ontologyGraph;
- (float)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)ontologyGraphData:(id *)a3;
- (unint64_t)beginIndex;
- (unint64_t)endIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKVMatchingSpan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_originAppId, 0);
  objc_storeStrong((id *)&self->_itemId, 0);
  objc_storeStrong((id *)&self->_semanticValue, 0);
  objc_storeStrong((id *)&self->_ontologyLabel, 0);
  objc_storeStrong((id *)&self->_ontologyGraph, 0);
}

- (float)score
{
  return self->_score;
}

- (CKVMatchingSpanMetadata)metadata
{
  return self->_metadata;
}

- (NSString)originAppId
{
  return self->_originAppId;
}

- (NSString)itemId
{
  return self->_itemId;
}

- (unint64_t)endIndex
{
  return self->_endIndex;
}

- (unint64_t)beginIndex
{
  return self->_beginIndex;
}

- (NSString)semanticValue
{
  return self->_semanticValue;
}

- (NSString)ontologyLabel
{
  return self->_ontologyLabel;
}

- (USOGraph)ontologyGraph
{
  return self->_ontologyGraph;
}

- (unint64_t)hash
{
  NSUInteger v15 = [(NSString *)self->_ontologyLabel hash];
  v3 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_beginIndex];
  uint64_t v4 = [v3 hash];
  v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_endIndex];
  uint64_t v6 = [v5 hash];
  NSUInteger v7 = [(NSString *)self->_itemId hash];
  NSUInteger v8 = [(NSString *)self->_originAppId hash];
  NSUInteger v9 = [(NSString *)self->_semanticValue hash];
  *(float *)&double v10 = self->_score;
  v11 = [MEMORY[0x1E4F28ED0] numberWithFloat:v10];
  uint64_t v12 = [v11 hash];
  unint64_t v13 = v4 ^ v15 ^ v6 ^ v7 ^ v8 ^ v9 ^ v12 ^ [(CKVMatchingSpanMetadata *)self->_metadata hash];

  return v13;
}

- (id)ontologyGraphData:(id *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(USOGraph *)self->_ontologyGraph getCppGraph];
  siri::ontology::UsoGraphProtoWriter::toProtobuf();
  uint64_t v3 = v6;
  PB::Writer::Writer((PB::Writer *)&v6);
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v3 + 24))(v3, &v6);
  uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v7 length:v6 - v7];
  PB::Writer::~Writer((PB::Writer *)&v6);
  (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  return v4;
}

- (BOOL)isEqualToMatchingSpan:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  ontologyLabel = self->_ontologyLabel;
  uint64_t v7 = [v4 ontologyLabel];
  LOBYTE(ontologyLabel) = [(NSString *)ontologyLabel isEqualToString:v7];

  if ((ontologyLabel & 1) == 0) {
    goto LABEL_9;
  }
  unint64_t beginIndex = self->_beginIndex;
  if (beginIndex != [v5 beginIndex]) {
    goto LABEL_9;
  }
  unint64_t endIndex = self->_endIndex;
  if (endIndex != [v5 endIndex]) {
    goto LABEL_9;
  }
  itemId = self->_itemId;
  v11 = [v5 itemId];
  LOBYTE(itemId) = [(NSString *)itemId isEqualToString:v11];

  if ((itemId & 1) == 0) {
    goto LABEL_9;
  }
  originAppId = self->_originAppId;
  unint64_t v13 = [v5 originAppId];
  LOBYTE(originAppId) = [(NSString *)originAppId isEqualToString:v13];

  if ((originAppId & 1) == 0) {
    goto LABEL_9;
  }
  semanticValue = self->_semanticValue;
  NSUInteger v15 = [v5 semanticValue];
  LOBYTE(semanticValue) = [(NSString *)semanticValue isEqualToString:v15];

  if ((semanticValue & 1) != 0 && (float score = self->_score, [v5 score], score == v17))
  {
    metadata = self->_metadata;
    v21 = [v5 metadata];
    BOOL v18 = [(CKVMatchingSpanMetadata *)metadata isEqual:v21];
  }
  else
  {
LABEL_9:
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKVMatchingSpan *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CKVMatchingSpan *)self isEqualToMatchingSpan:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  objc_storeStrong((id *)(v5 + 16), self->_ontologyGraph);
  uint64_t v6 = [(NSString *)self->_ontologyLabel copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  *(void *)(v5 + 40) = self->_beginIndex;
  *(void *)(v5 + 48) = self->_endIndex;
  uint64_t v8 = [(NSString *)self->_itemId copyWithZone:a3];
  NSUInteger v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_originAppId copyWithZone:a3];
  v11 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v10;

  uint64_t v12 = [(NSString *)self->_semanticValue copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  *(float *)(v5 + 8) = self->_score;
  id v14 = [(CKVMatchingSpanMetadata *)self->_metadata copyWithZone:a3];
  NSUInteger v15 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v14;

  return (id)v5;
}

- (CKVMatchingSpan)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKVMatchingSpan;
  uint64_t v5 = [(CKVMatchingSpan *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ontologyGraph"];
    ontologyGraph = v5->_ontologyGraph;
    v5->_ontologyGraph = (USOGraph *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ontologyLabel"];
    ontologyLabel = v5->_ontologyLabel;
    v5->_ontologyLabel = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"b"];
    v5->_unint64_t beginIndex = [v10 unsignedLongValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"e"];
    v5->_unint64_t endIndex = [v11 unsignedLongValue];

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemId"];
    itemId = v5->_itemId;
    v5->_itemId = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appId"];
    originAppId = v5->_originAppId;
    v5->_originAppId = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"semanticValue"];
    semanticValue = v5->_semanticValue;
    v5->_semanticValue = (NSString *)v16;

    [v4 decodeFloatForKey:@"score"];
    v5->_float score = v18;
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
    metadata = v5->_metadata;
    v5->_metadata = (CKVMatchingSpanMetadata *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeObject:self->_ontologyGraph forKey:@"ontologyGraph"];
  [v7 encodeObject:self->_ontologyLabel forKey:@"ontologyLabel"];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:self->_beginIndex];
  [v7 encodeObject:v4 forKey:@"b"];

  uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLong:self->_endIndex];
  [v7 encodeObject:v5 forKey:@"e"];

  [v7 encodeObject:self->_itemId forKey:@"itemId"];
  [v7 encodeObject:self->_originAppId forKey:@"appId"];
  [v7 encodeObject:self->_semanticValue forKey:@"semanticValue"];
  *(float *)&double v6 = self->_score;
  [v7 encodeFloat:@"score" forKey:v6];
  [v7 encodeObject:self->_metadata forKey:@"metadata"];
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)CKVMatchingSpan;
  uint64_t v3 = [(CKVMatchingSpan *)&v9 description];
  ontologyLabel = self->_ontologyLabel;
  originAppId = self->_originAppId;
  double v6 = [(CKVMatchingSpanMetadata *)self->_metadata description];
  id v7 = [v3 stringByAppendingFormat:@" ontologyLabel: %@, originAppId: %@, metadata: %@", ontologyLabel, originAppId, v6];

  return v7;
}

- (CKVMatchingSpan)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use internal initializer" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVMatchingSpan)initWithOntologyGraph:(id)a3 ontologyLabel:(id)a4 semanticValue:(id)a5 beginIndex:(unint64_t)a6 endIndex:(unint64_t)a7 itemId:(id)a8 originAppId:(id)a9 score:(float)a10 matchScore:(float)a11 priorInfo:(id)a12
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v45 = a4;
  id v46 = a5;
  id v21 = a8;
  id v47 = a9;
  id v22 = a12;
  v48.receiver = self;
  v48.super_class = (Class)CKVMatchingSpan;
  v23 = [(CKVMatchingSpan *)&v48 init];
  v24 = v23;
  if (!v23) {
    goto LABEL_8;
  }
  p_ontologyGraph = &v23->_ontologyGraph;
  objc_storeStrong((id *)&v23->_ontologyGraph, a3);
  if (!*p_ontologyGraph)
  {
    uint64_t v33 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v50 = "-[CKVMatchingSpan initWithOntologyGraph:ontologyLabel:semanticValue:beginIndex:endIndex:itemId:originAppId:s"
            "core:matchScore:priorInfo:]";
      v34 = "%s nil ontologyGraph";
      v35 = v33;
      uint32_t v36 = 12;
LABEL_19:
      _os_log_error_impl(&dword_1A77B3000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  objc_storeStrong((id *)&v24->_ontologyLabel, a4);
  if (![(NSString *)v24->_ontologyLabel length])
  {
    uint64_t v37 = CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    ontologyLabel = v24->_ontologyLabel;
    *(_DWORD *)buf = 136315394;
    v50 = "-[CKVMatchingSpan initWithOntologyGraph:ontologyLabel:semanticValue:beginIndex:endIndex:itemId:originAppId:sco"
          "re:matchScore:priorInfo:]";
    __int16 v51 = 2112;
    v52 = ontologyLabel;
    v34 = "%s invalid ontologyLabel: %@";
LABEL_17:
    v35 = v37;
LABEL_18:
    uint32_t v36 = 22;
    goto LABEL_19;
  }
  objc_storeStrong((id *)&v24->_semanticValue, a5);
  if (![(NSString *)v24->_semanticValue length])
  {
    uint64_t v37 = CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    semanticValue = v24->_semanticValue;
    *(_DWORD *)buf = 136315394;
    v50 = "-[CKVMatchingSpan initWithOntologyGraph:ontologyLabel:semanticValue:beginIndex:endIndex:itemId:originAppId:sco"
          "re:matchScore:priorInfo:]";
    __int16 v51 = 2112;
    v52 = semanticValue;
    v34 = "%s invalid semanticValue: %@";
    goto LABEL_17;
  }
  v24->_unint64_t beginIndex = a6;
  v24->_unint64_t endIndex = a7;
  uint64_t v26 = [v21 copy];
  itemId = v24->_itemId;
  v24->_itemId = (NSString *)v26;

  if (![(NSString *)v24->_itemId length])
  {
    uint64_t v37 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v40 = v24->_itemId;
      *(_DWORD *)buf = 136315394;
      v50 = "-[CKVMatchingSpan initWithOntologyGraph:ontologyLabel:semanticValue:beginIndex:endIndex:itemId:originAppId:s"
            "core:matchScore:priorInfo:]";
      __int16 v51 = 2112;
      v52 = v40;
      v34 = "%s invalid itemId: %@";
      goto LABEL_17;
    }
LABEL_21:
    v32 = 0;
    goto LABEL_22;
  }
  objc_storeStrong((id *)&v24->_originAppId, a9);
  if (![(NSString *)v24->_originAppId length])
  {
    uint64_t v41 = CKLogContextVocabulary;
    if (!os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    originAppId = v24->_originAppId;
    *(_DWORD *)buf = 136315394;
    v50 = "-[CKVMatchingSpan initWithOntologyGraph:ontologyLabel:semanticValue:beginIndex:endIndex:itemId:originAppId:sco"
          "re:matchScore:priorInfo:]";
    __int16 v51 = 2112;
    v52 = originAppId;
    v34 = "%s invalid originAppId: %@";
    v35 = v41;
    goto LABEL_18;
  }
  v24->_float score = a10;
  v28 = [CKVMatchingSpanMetadata alloc];
  *(float *)&double v29 = a11;
  uint64_t v30 = [(CKVMatchingSpanMetadata *)v28 initWithMatchingSpanPriorInfo:v22 matchScore:v29];
  metadata = v24->_metadata;
  v24->_metadata = (CKVMatchingSpanMetadata *)v30;

LABEL_8:
  v32 = v24;
LABEL_22:

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_extractOntologyLabelFromGraph:(id)a3
{
  id v3 = a3;
  [v3 getCppRootNode];
  siri::ontology::UsoGraph::getSuccessors();
  id v4 = v27;
  if (v27 == __p) {
    goto LABEL_32;
  }
  if ((*(unsigned int (**)(void))(**(void **)__p + 16))() != 2) {
    goto LABEL_35;
  }
  siri::ontology::UsoGraph::getSuccessors();
  size_t v5 = v24.__r_.__value_.__l.__size_ - v24.__r_.__value_.__r.__words[0];
  unint64_t v6 = (uint64_t)(v24.__r_.__value_.__l.__size_ - v24.__r_.__value_.__r.__words[0]) >> 3;
  uint64_t v7 = (uint64_t)v28;
  uint64_t v8 = (char *)__p;
  if (v6 > (v28 - (unsigned char *)__p) >> 3)
  {
    if (__p)
    {
      operator delete(__p);
      uint64_t v7 = 0;
      __p = 0;
      v27 = 0;
      v28 = 0;
    }
    if ((v5 & 0x8000000000000000) != 0) {
      goto LABEL_49;
    }
    uint64_t v9 = v7 >> 2;
    if (v7 >> 2 <= v6) {
      uint64_t v9 = (uint64_t)(v24.__r_.__value_.__l.__size_ - v24.__r_.__value_.__r.__words[0]) >> 3;
    }
    unint64_t v10 = (unint64_t)v7 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v9;
    if (v10 >> 61) {
LABEL_49:
    }
      std::vector<std::reference_wrapper<siri::ontology::UsoGraphNode>>::__throw_length_error[abi:ne180100]();
    uint64_t v8 = (char *)operator new(8 * v10);
    __p = v8;
    v27 = v8;
    v28 = &v8[8 * v10];
    goto LABEL_19;
  }
  unint64_t v11 = (v27 - (unsigned char *)__p) >> 3;
  if (v11 >= v6)
  {
LABEL_19:
    if (v24.__r_.__value_.__l.__size_ == v24.__r_.__value_.__r.__words[0]) {
      goto LABEL_22;
    }
    unint64_t v13 = v8;
    uint64_t v14 = (const void *)v24.__r_.__value_.__r.__words[0];
    goto LABEL_21;
  }
  std::string::size_type v12 = v24.__r_.__value_.__r.__words[0] + 8 * v11;
  if (v27 != __p)
  {
    memmove(__p, v24.__r_.__value_.__l.__data_, v27 - (unsigned char *)__p);
    uint64_t v8 = v27;
  }
  size_t v5 = v24.__r_.__value_.__l.__size_ - v12;
  if (v24.__r_.__value_.__l.__size_ != v12)
  {
    unint64_t v13 = v8;
    uint64_t v14 = (const void *)v12;
LABEL_21:
    memmove(v13, v14, v5);
  }
LABEL_22:
  id v4 = &v8[v5];
  v27 = &v8[v5];
  if (v24.__r_.__value_.__r.__words[0])
  {
    v24.__r_.__value_.__l.__size_ = v24.__r_.__value_.__r.__words[0];
    operator delete(v24.__r_.__value_.__l.__data_);
    id v4 = v27;
  }
  if (v4 != __p)
  {
    if ((*(unsigned int (**)(void))(**(void **)__p + 16))() == 3)
    {
      NSUInteger v15 = *(siri::ontology::UsoEntityNode **)__p;
      siri::ontology::UsoEntityNode::getEntitySpans((uint64_t *)&v24, *(siri::ontology::UsoEntityNode **)__p);
      long long v16 = *(_OWORD *)&v24.__r_.__value_.__l.__data_;
      if (v24.__r_.__value_.__r.__words[0])
      {
        v24.__r_.__value_.__l.__size_ = v24.__r_.__value_.__r.__words[0];
        operator delete((void *)v16);
      }
      if (*((void *)&v16 + 1) != (void)v16)
      {
        siri::ontology::UsoEntityNode::getEntitySpans((uint64_t *)&v22, v15);
        float v17 = v22;
        uint64_t v18 = *(void *)v22;
        v24.__r_.__value_.__s.__data_[0] = 0;
        char v25 = 0;
        if (*(unsigned char *)(v18 + 64))
        {
          if (*(char *)(v18 + 63) < 0)
          {
            std::string::__init_copy_ctor_external(&v24, *(const std::string::value_type **)(v18 + 40), *(void *)(v18 + 48));
            float v17 = v22;
            char v25 = 1;
            if (!v22) {
              goto LABEL_43;
            }
          }
          else
          {
            std::string v24 = *(std::string *)(v18 + 40);
            char v25 = 1;
          }
          v23 = v17;
          operator delete(v17);
LABEL_43:
          if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            id v21 = &v24;
          }
          else {
            id v21 = (std::string *)v24.__r_.__value_.__r.__words[0];
          }
          uint64_t v19 = [NSString stringWithCString:v21 encoding:4];
          if (v25 && SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v24.__r_.__value_.__l.__data_);
          }
LABEL_36:
          id v4 = (char *)__p;
          if (!__p) {
            goto LABEL_38;
          }
          goto LABEL_37;
        }
        v23 = v22;
        operator delete(v22);
      }
    }
LABEL_35:
    uint64_t v19 = 0;
    goto LABEL_36;
  }
LABEL_32:
  uint64_t v19 = 0;
  if (v4)
  {
LABEL_37:
    v27 = v4;
    operator delete(v4);
  }
LABEL_38:

  return v19;
}

+ (id)matchingSpanFromSpanMatchResult:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v30 = 0;
  id v4 = [v3 toOntologyGraph:&v30];
  id v5 = v30;
  if (v4)
  {
    v28 = [(id)objc_opt_class() _extractOntologyLabelFromGraph:v4];
    unint64_t v6 = [v3 spanInfo];
    uint64_t v7 = [v6 spanRange];
    uint64_t v9 = v8;

    unint64_t v10 = [v3 entityInfo];
    if ([v10 entityType] == 1)
    {
      id v29 = v5;
      unint64_t v11 = [v10 toKVItem:&v29];
      id v27 = v29;

      if (v11)
      {
        id v12 = objc_alloc((Class)objc_opt_class());
        uint64_t v26 = [v3 spanValue];
        unint64_t v13 = [v11 itemId];
        uint64_t v14 = [v10 sourceIdentifierOrConstant];
        [v3 score];
        int v16 = v15;
        float v17 = [v3 spanInfo];
        [v17 matchScore];
        LODWORD(v19) = v18;
        LODWORD(v20) = v16;
        id v21 = (void *)[v12 initWithOntologyGraph:v4 ontologyLabel:v28 semanticValue:v26 beginIndex:v7 endIndex:v7 + v9 itemId:v13 originAppId:v20 score:v19 matchScore:v14 priorInfo:0];
      }
      else
      {
        std::string v24 = CKLogContextVocabulary;
        if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v32 = "+[CKVMatchingSpan matchingSpanFromSpanMatchResult:]";
          __int16 v33 = 2112;
          id v34 = v3;
          __int16 v35 = 2112;
          id v36 = v27;
          _os_log_error_impl(&dword_1A77B3000, v24, OS_LOG_TYPE_ERROR, "%s Failed to resolve item from result: %@ error: %@", buf, 0x20u);
        }
        id v21 = 0;
      }

      id v5 = v27;
    }
    else
    {
      v23 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "+[CKVMatchingSpan matchingSpanFromSpanMatchResult:]";
        __int16 v33 = 2112;
        id v34 = v3;
        _os_log_error_impl(&dword_1A77B3000, v23, OS_LOG_TYPE_ERROR, "%s Unsupported entityInfo for result: %@", buf, 0x16u);
      }
      id v21 = 0;
    }
  }
  else
  {
    id v22 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "+[CKVMatchingSpan matchingSpanFromSpanMatchResult:]";
      __int16 v33 = 2112;
      id v34 = v5;
      _os_log_error_impl(&dword_1A77B3000, v22, OS_LOG_TYPE_ERROR, "%s Omitting result: %@", buf, 0x16u);
    }
    id v21 = 0;
  }

  return v21;
}

@end