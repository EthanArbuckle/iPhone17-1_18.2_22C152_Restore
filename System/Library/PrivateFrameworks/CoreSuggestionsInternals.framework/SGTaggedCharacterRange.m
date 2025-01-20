@interface SGTaggedCharacterRange
+ (BOOL)supportsSecureCoding;
+ (id)annotationTypeUniqueIdentifier:(unint64_t)a3;
+ (id)biosBasedAnnotation:(id)a3 usingTags:(id)a4 forSection:(id)a5;
+ (id)describeAnnotationType:(unint64_t)a3;
+ (id)enrichAndFilterTaggedCharacterRanges:(id)a3 usingMapping:(id)a4 withAnnotationType:(unint64_t)a5;
+ (id)flattenTaggedCharacterRanges:(id)a3 usingWhitelist:(id)a4 replaceOOVWithToken:(id)a5;
+ (id)mergeTaggedCharacterRanges:(id)a3 usingBaseTaggedCharacterRanges:(id)a4 extraTags:(id)a5 tagOverrides:(id)a6 alignWithGroundTruth:(id)a7;
+ (id)mergeTagsFromTaggedCharacterRanges:(id)a3 withTaggedCharacterRanges:(id)a4;
+ (id)state:(id)a3 index:(int)a4 section:(id)a5;
+ (unint64_t)annotationTypeFromString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTaggedCharacterRange:(id)a3;
- (NSArray)tags;
- (NSString)text;
- (SGTaggedCharacterRange)initWithAnnotationType:(unint64_t)a3 tags:(id)a4 range:(_NSRange)a5 text:(id)a6;
- (SGTaggedCharacterRange)initWithCoder:(id)a3;
- (SGTaggedCharacterRange)initWithDict:(id)a3;
- (_NSRange)range;
- (id)annotationTypeUniqueIdentifier;
- (id)description;
- (id)dictRepresentation;
- (unint64_t)annotationType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGTaggedCharacterRange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_tags, 0);
}

- (NSString)text
{
  return self->_text;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSArray)tags
{
  return self->_tags;
}

- (unint64_t)annotationType
{
  return self->_annotationType;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(id)objc_opt_class() describeAnnotationType:self->_annotationType];
  v5 = (void *)[v3 initWithFormat:@"<SGTaggedCharacterRange annotationType:%@ tags:%@ text:%@>", v4, self->_tags, self->_text];

  return v5;
}

- (id)annotationTypeUniqueIdentifier
{
  return +[SGTaggedCharacterRange annotationTypeUniqueIdentifier:self->_annotationType];
}

- (SGTaggedCharacterRange)initWithCoder:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SGTaggedCharacterRange;
  v6 = [(SGTaggedCharacterRange *)&v21 init];
  if (v6)
  {
    v6->_annotationType = [v5 decodeInt64ForKey:@"annotationType"];
    uint64_t v7 = [v5 decodeInt64ForKey:@"loc"];
    uint64_t v8 = [v5 decodeInt64ForKey:@"len"];
    v6->_range.NSUInteger location = v7;
    v6->_range.NSUInteger length = v8;
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v9, "initWithObjects:", v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v5 decodeObjectOfClasses:v12 forKey:@"tags"];

    if (!v13)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, v6, @"SGTaggedCharacterRange.m", 101, @"nonnull NSArray<%@*> *%@ was null when decoded", @"NSString", @"tags" object file lineNumber description];
    }
    tags = v6->_tags;
    v6->_tags = (NSArray *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v16 = [v5 decodeObjectOfClasses:v15 forKey:@"text"];

    if (v16)
    {
      v17 = v16;
      text = v6->_text;
      v6->_text = v17;
    }
    else
    {
      text = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(text, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"SGTaggedCharacterRange.m", 102, @"nonnull property %s *%s was null when decoded", "NSString", "text");
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t annotationType = self->_annotationType;
  id v5 = a3;
  [v5 encodeInt64:annotationType forKey:@"annotationType"];
  [v5 encodeInt64:self->_range.location forKey:@"loc"];
  [v5 encodeInt64:self->_range.length forKey:@"len"];
  [v5 encodeObject:self->_tags forKey:@"tags"];
  [v5 encodeObject:self->_text forKey:@"text"];
}

- (unint64_t)hash
{
  NSUInteger v2 = self->_range.location - self->_annotationType + 32 * self->_annotationType;
  return self->_range.length - v2 + 32 * v2;
}

- (BOOL)isEqualToTaggedCharacterRange:(id)a3
{
  v4 = (id *)a3;
  unint64_t annotationType = self->_annotationType;
  if (annotationType != [v4 annotationType]) {
    goto LABEL_4;
  }
  tags = self->_tags;
  uint64_t v7 = (NSArray *)v4[2];
  if (tags == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    id v9 = tags;
    char v10 = [(NSArray *)v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
LABEL_4:
      char v11 = 0;
      goto LABEL_12;
    }
  }
  char v11 = 0;
  if (self->_range.location == [v4 range] && self->_range.length == v12)
  {
    uint64_t v13 = self->_text;
    v14 = v13;
    if (v13 == v4[3]) {
      char v11 = 1;
    }
    else {
      char v11 = -[NSString isEqual:](v13, "isEqual:");
    }
  }
LABEL_12:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGTaggedCharacterRange *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGTaggedCharacterRange *)self isEqualToTaggedCharacterRange:v5];

  return v6;
}

- (id)dictRepresentation
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v14[0] = @"annotationType";
  id v3 = +[SGTaggedCharacterRange describeAnnotationType:[(SGTaggedCharacterRange *)self annotationType]];
  v15[0] = v3;
  v14[1] = @"tags";
  v4 = [(SGTaggedCharacterRange *)self tags];
  v15[1] = v4;
  v14[2] = @"range";
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SGTaggedCharacterRange range](self, "range"));
  v13[0] = v5;
  BOOL v6 = NSNumber;
  [(SGTaggedCharacterRange *)self range];
  uint64_t v8 = [v6 numberWithUnsignedInteger:v7];
  v13[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v15[2] = v9;
  v14[3] = @"text";
  char v10 = [(SGTaggedCharacterRange *)self text];
  v15[3] = v10;
  char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

  return v11;
}

- (SGTaggedCharacterRange)initWithDict:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  v17 = [v4 objectForKeyedSubscript:@"annotationType"];
  uint64_t v16 = [v5 annotationTypeFromString:v17];
  BOOL v6 = [v4 objectForKeyedSubscript:@"tags"];
  uint64_t v7 = [v4 objectForKeyedSubscript:@"range"];
  uint64_t v8 = [v7 objectAtIndexedSubscript:0];
  uint64_t v9 = [v8 integerValue];
  char v10 = [v4 objectForKeyedSubscript:@"range"];
  char v11 = [v10 objectAtIndexedSubscript:1];
  uint64_t v12 = [v11 integerValue];
  uint64_t v13 = [v4 objectForKeyedSubscript:@"text"];

  v14 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](self, "initWithAnnotationType:tags:range:text:", v16, v6, v9, v12, v13);
  return v14;
}

- (SGTaggedCharacterRange)initWithAnnotationType:(unint64_t)a3 tags:(id)a4 range:(_NSRange)a5 text:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SGTaggedCharacterRange;
  v14 = [(SGTaggedCharacterRange *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_unint64_t annotationType = a3;
    objc_storeStrong((id *)&v14->_tags, a4);
    v15->_range.NSUInteger location = location;
    v15->_range.NSUInteger length = length;
    objc_storeStrong((id *)&v15->_text, a6);
  }

  return v15;
}

+ (id)flattenTaggedCharacterRanges:(id)a3 usingWhitelist:(id)a4 replaceOOVWithToken:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v31 = (id)objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v7;
  uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v40;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v10;
        char v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        context = (void *)MEMORY[0x1CB79B230]();
        id v12 = objc_opt_new();
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v13 = [v11 tags];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v36 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              int v19 = [v18 characterAtIndex:0];
              if (v19 != [@"L" characterAtIndex:0]
                || (v20 = [v8 containsObject:v18], id v21 = v9, v20))
              {
                int v22 = [@"H" characterAtIndex:0];
                id v21 = v18;
                if (v19 == v22) {
                  continue;
                }
              }
              [v12 addObject:v21];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
          }
          while (v15);
        }

        v23 = [v12 sortedArrayUsingSelector:sel_compare_];
        v24 = objc_msgSend(v23, "_pas_componentsJoinedByString:", @"&");

        if ([v24 containsString:@" "])
        {
          v25 = [MEMORY[0x1E4F28B00] currentHandler];
          [v25 handleFailureInMethod:a2 object:a1 file:@"SGTaggedCharacterRange.m" lineNumber:444 description:@"tags contains space"];
        }
        [v31 addObject:v24];

        uint64_t v10 = v34 + 1;
      }
      while (v34 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v32);
  }

  return v31;
}

+ (id)state:(id)a3 index:(int)a4 section:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([v7 count] <= (unint64_t)a4)
  {
    objc_super v17 = &stru_1F24EEF20;
  }
  else
  {
    [v7 objectAtIndex:a4];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v19 = v7;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"%@_", v8];
          char v16 = [v14 hasPrefix:v15];

          if (v16)
          {
            objc_super v17 = [v14 substringFromIndex:2];
            id v7 = v19;
            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      id v7 = v19;
    }
    objc_super v17 = &stru_1F24EEF20;
LABEL_14:
  }
  return v17;
}

+ (id)biosBasedAnnotation:(id)a3 usingTags:(id)a4 forSection:(id)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v33 = v8;
  id v10 = [(id)objc_opt_class() state:v8 index:0 section:v9];
  id v32 = (id)objc_opt_new();
  if ([v7 count])
  {
    unint64_t v11 = 0;
    uint64_t v12 = 0;
    id v13 = &stru_1F24EEF20;
    id v30 = v9;
    id v31 = v7;
    do
    {
      uint64_t v14 = [v7 objectAtIndex:v11];
      uint64_t v15 = [(id)objc_opt_class() state:v33 index:++v11 section:v9];

      if ([v10 length])
      {
        uint64_t v34 = v15;
        if ([(__CFString *)v13 isEqualToString:v10])
        {
          char v16 = [SGTaggedCharacterRange alloc];
          objc_super v17 = (void *)[[NSString alloc] initWithFormat:@"section_%@_intermediate", v9];
          v37[0] = v17;
          v18 = (void *)MEMORY[0x1E4F1C978];
          id v19 = (void **)v37;
        }
        else
        {
          int v20 = [v15 isEqualToString:v10];
          char v16 = [SGTaggedCharacterRange alloc];
          id v21 = [NSString alloc];
          if (v20)
          {
            objc_super v17 = (void *)[v21 initWithFormat:@"section_%@_begin", v9];
            long long v36 = v17;
            v18 = (void *)MEMORY[0x1E4F1C978];
            id v19 = &v36;
          }
          else
          {
            objc_super v17 = (void *)[v21 initWithFormat:@"section_%@_single", v9];
            long long v35 = v17;
            v18 = (void *)MEMORY[0x1E4F1C978];
            id v19 = &v35;
          }
        }
        long long v22 = [v18 arrayWithObjects:v19 count:1];
        uint64_t v23 = [v14 range];
        uint64_t v25 = v24;
        v26 = [v14 text];
        v27 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v16, "initWithAnnotationType:tags:range:text:", 6, v22, v23, v25, v26);
        [v32 addObject:v27];

        id v9 = v30;
        id v7 = v31;
        uint64_t v15 = v34;
      }
      v28 = (__CFString *)v10;

      id v10 = v15;
      id v13 = v28;
      uint64_t v12 = v10;
    }
    while ([v7 count] > v11);
  }
  else
  {
    v28 = &stru_1F24EEF20;
  }

  return v32;
}

+ (id)mergeTaggedCharacterRanges:(id)a3 usingBaseTaggedCharacterRanges:(id)a4 extraTags:(id)a5 tagOverrides:(id)a6 alignWithGroundTruth:(id)a7
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  id v91 = a3;
  id v87 = a4;
  id v11 = a5;
  id v93 = a6;
  id v92 = a7;
  v89 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v12 = objc_opt_new();
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id obj = v11;
  uint64_t v97 = [obj countByEnumeratingWithState:&v120 objects:v127 count:16];
  if (v97)
  {
    id v95 = *(id *)v121;
    do
    {
      id v13 = 0;
      do
      {
        if (*(id *)v121 != v95) {
          objc_enumerationMutation(obj);
        }
        v101 = v13;
        uint64_t v14 = *(void **)(*((void *)&v120 + 1) + 8 * (void)v13);
        context = (void *)MEMORY[0x1CB79B230]();
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        uint64_t v15 = [v14 tags];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v116 objects:v126 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v117;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v117 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v116 + 1) + 8 * i);
              id v21 = [NSString alloc];
              long long v22 = [v14 annotationTypeUniqueIdentifier];
              uint64_t v23 = (void *)[v21 initWithFormat:@"%@_%@", v22, v20];
              [v12 addObject:v23];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v116 objects:v126 count:16];
          }
          while (v17);
        }

        id v13 = v101 + 1;
      }
      while (v101 + 1 != (char *)v97);
      uint64_t v97 = [obj countByEnumeratingWithState:&v120 objects:v127 count:16];
    }
    while (v97);
  }

  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v24 = v87;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v112 objects:v125 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    unint64_t v27 = 0;
    uint64_t v28 = *(void *)v113;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v113 != v28) {
          objc_enumerationMutation(v24);
        }
        id v30 = *(void **)(*((void *)&v112 + 1) + 8 * j);
        id v31 = (void *)MEMORY[0x1CB79B230]();
        if (v27 > [v30 range])
        {
          uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
          [v34 handleFailureInMethod:a2 object:a1 file:@"SGTaggedCharacterRange.m" lineNumber:284 description:@"The baseTaggedCharacterRangeArray isn't sorted."];
        }
        uint64_t v32 = [v30 range];
        [v30 range];
        unint64_t v27 = v33 + v32;
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v112 objects:v125 count:16];
    }
    while (v26);
  }

  long long v35 = [a1 mergeTagsFromTaggedCharacterRanges:v24 withTaggedCharacterRanges:v91];
  uint64_t v107 = MEMORY[0x1E4F143A8];
  uint64_t v108 = 3221225472;
  v109 = __128__SGTaggedCharacterRange_mergeTaggedCharacterRanges_usingBaseTaggedCharacterRanges_extraTags_tagOverrides_alignWithGroundTruth___block_invoke;
  v110 = &unk_1E65BA3C8;
  id v88 = v12;
  id v111 = v88;
  long long v36 = sgMap();

  long long v37 = objc_opt_new();
  long long v38 = [(id)objc_opt_class() biosBasedAnnotation:v24 usingTags:v36 forSection:@"N"];
  [v37 addObjectsFromArray:v38];

  long long v39 = [(id)objc_opt_class() biosBasedAnnotation:v24 usingTags:v36 forSection:@"D"];
  [v37 addObjectsFromArray:v39];

  v86 = v37;
  long long v40 = [a1 mergeTagsFromTaggedCharacterRanges:v24 withTaggedCharacterRanges:v37];
  long long v41 = objc_opt_new();
  if ([v36 count])
  {
    unint64_t v42 = 0;
    do
    {
      v43 = [v36 objectAtIndexedSubscript:v42];
      v44 = [v40 objectAtIndexedSubscript:v42];
      uint64_t v45 = [v43 setByAddingObjectsFromSet:v44];
      [v41 addObject:v45];

      ++v42;
    }
    while ([v36 count] > v42);
  }
  v85 = v40;
  id v46 = v41;

  v47 = v46;
  if (v92)
  {
    v48 = [a1 mergeTagsFromTaggedCharacterRanges:v24 withTaggedCharacterRanges:v92];
    v47 = objc_opt_new();
    if ([v46 count])
    {
      unint64_t v49 = 0;
      do
      {
        v50 = [v46 objectAtIndexedSubscript:v49];
        v51 = [v48 objectAtIndexedSubscript:v49];
        v52 = [v50 setByAddingObjectsFromSet:v51];
        [v47 addObject:v52];

        ++v49;
      }
      while ([v46 count] > v49);
    }
  }
  v84 = v46;
  id v96 = (id)objc_opt_new();
  if ([v24 count])
  {
    v53 = 0;
    v98 = v47;
    do
    {
      v102 = (void *)MEMORY[0x1CB79B230]();
      v54 = [v24 objectAtIndexedSubscript:v53];
      contexta = v53;
      v55 = [v47 objectAtIndexedSubscript:v53];
      v56 = (void *)[v55 mutableCopy];

      unint64_t v57 = [v56 count];
      long long v103 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id v58 = v93;
      uint64_t v59 = [v58 countByEnumeratingWithState:&v103 objects:v124 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v104;
        do
        {
          for (uint64_t k = 0; k != v60; ++k)
          {
            if (*(void *)v104 != v61) {
              objc_enumerationMutation(v58);
            }
            uint64_t v63 = *(void *)(*((void *)&v103 + 1) + 8 * k);
            v64 = [v58 objectForKeyedSubscript:v63];
            [v56 minusSet:v64];

            if ([v56 count] < v57)
            {
              [v56 addObject:v63];
              unint64_t v57 = [v56 count];
            }
          }
          uint64_t v60 = [v58 countByEnumeratingWithState:&v103 objects:v124 count:16];
        }
        while (v60);
      }

      v65 = (void *)MEMORY[0x1CB79B230]();
      v66 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF beginswith 'L'"];
      v67 = [v56 filteredSetUsingPredicate:v66];

      if ([v67 count])
      {
        if ([v67 count] != 1)
        {
          v81 = [MEMORY[0x1E4F28B00] currentHandler];
          [v81 handleFailureInMethod:a2, a1, @"SGTaggedCharacterRange.m", 350, @"Error in TaggedCharacterRange tags, only one can be of type SGTaggedCharacterRangeAnnotationTypeNLTaggerLemma" object file lineNumber description];
        }
        v68 = [v67 anyObject];
        v69 = [v68 substringFromIndex:2];
        v70 = [v69 lowercaseString];

        [v56 minusSet:v67];
        v71 = (void *)[[NSString alloc] initWithFormat:@"L_%@", v70];
        [v56 addObject:v71];
      }
      else
      {
        id v72 = [NSString alloc];
        v70 = [v54 text];
        v71 = [v70 lowercaseString];
        v73 = (void *)[v72 initWithFormat:@"L_%@", v71];
        [v56 addObject:v73];
      }
      if (v57)
      {
        v74 = [SGTaggedCharacterRange alloc];
        v75 = [v56 allObjects];
        uint64_t v76 = [v54 range];
        uint64_t v78 = v77;
        v79 = [v54 text];
        v80 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v74, "initWithAnnotationType:tags:range:text:", 4, v75, v76, v78, v79);
        [v96 addObject:v80];
      }
      v53 = contexta + 1;
      v47 = v98;
    }
    while ([v24 count] > (unint64_t)(contexta + 1));
  }

  return v96;
}

uint64_t __128__SGTaggedCharacterRange_mergeTaggedCharacterRanges_usingBaseTaggedCharacterRanges_extraTags_tagOverrides_alignWithGroundTruth___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setByAddingObjectsFromSet:*(void *)(a1 + 32)];
}

+ (id)mergeTagsFromTaggedCharacterRanges:(id)a3 withTaggedCharacterRanges:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v28 = a4;
  id v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v5;
  uint64_t v29 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v29)
  {
    uint64_t v26 = *(void *)v46;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v46 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v31 = v6;
        id v7 = *(void **)(*((void *)&v45 + 1) + 8 * v6);
        context = (void *)MEMORY[0x1CB79B230]();
        id v8 = objc_opt_new();
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v32 = v28;
        uint64_t v35 = [v32 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v35)
        {
          uint64_t v33 = v7;
          uint64_t v34 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v42 != v34) {
                objc_enumerationMutation(v32);
              }
              id v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              if (v7 != v10)
              {
                NSUInteger v11 = [v7 range];
                NSUInteger v13 = v12;
                v55.NSUInteger location = [v10 range];
                v55.NSUInteger length = v14;
                v54.NSUInteger location = v11;
                v54.NSUInteger length = v13;
                if (!NSIntersectionRange(v54, v55).length) {
                  continue;
                }
              }
              uint64_t v36 = i;
              long long v39 = 0u;
              long long v40 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              uint64_t v15 = [v10 tags];
              uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v49 count:16];
              if (v16)
              {
                uint64_t v17 = v16;
                uint64_t v18 = *(void *)v38;
                do
                {
                  for (uint64_t j = 0; j != v17; ++j)
                  {
                    if (*(void *)v38 != v18) {
                      objc_enumerationMutation(v15);
                    }
                    uint64_t v20 = *(void *)(*((void *)&v37 + 1) + 8 * j);
                    id v21 = [NSString alloc];
                    long long v22 = [v10 annotationTypeUniqueIdentifier];
                    uint64_t v23 = (void *)[v21 initWithFormat:@"%@_%@", v22, v20];
                    [v8 addObject:v23];
                  }
                  uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v49 count:16];
                }
                while (v17);
              }

              id v7 = v33;
              uint64_t i = v36;
            }
            uint64_t v35 = [v32 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }
          while (v35);
        }

        [v27 addObject:v8];
        uint64_t v6 = v31 + 1;
      }
      while (v31 + 1 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v29);
  }

  return v27;
}

+ (id)enrichAndFilterTaggedCharacterRanges:(id)a3 usingMapping:(id)a4 withAnnotationType:(unint64_t)a5
{
  id v8 = a4;
  id v5 = v8;
  uint64_t v6 = sgMapAndFilter();

  return v6;
}

SGTaggedCharacterRange *__95__SGTaggedCharacterRange_enrichAndFilterTaggedCharacterRanges_usingMapping_withAnnotationType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v25 = a1;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        NSUInteger v11 = [v3 text];
        NSUInteger v12 = [v10 objectForKeyedSubscript:v11];

        if (v12) {
          goto LABEL_7;
        }
        if ([v3 annotationType] == 3)
        {
          NSUInteger v13 = [v3 tags];
          uint64_t v14 = [v13 count];

          if (v14 == 1)
          {
            uint64_t v15 = [v3 tags];
            uint64_t v16 = [v15 firstObject];
            NSUInteger v12 = [v10 objectForKeyedSubscript:v16];

            if (v12)
            {
LABEL_7:
              [v4 addObject:v12];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    uint64_t v17 = [SGTaggedCharacterRange alloc];
    uint64_t v18 = *(void *)(v25 + 40);
    uint64_t v19 = [v3 range];
    uint64_t v21 = v20;
    long long v22 = [v3 text];
    uint64_t v23 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v17, "initWithAnnotationType:tags:range:text:", v18, v4, v19, v21, v22);
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

+ (id)annotationTypeUniqueIdentifier:(unint64_t)a3
{
  if (a3 - 1 > 0xC) {
    return @"U";
  }
  else {
    return off_1E65BA450[a3 - 1];
  }
}

+ (unint64_t)annotationTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AnnotationTypeDataDetectors"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"AnnotationTypeNLTaggerLexicalClass"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"AnnotationTypeNLTaggerLemma"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"AnnotationTypeCrossAnnotation"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"AnnotationTypeMetadata"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"AnnotationTypeMisc"])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"AnnotationTypeReminder"])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"AnnotationTypeHuman"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"AnnotationTypePadding"])
  {
    unint64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"AnnotationTypeModelOutput"])
  {
    unint64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"AnnotationTypeHTML"])
  {
    unint64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"AnnotationTypeCSS"])
  {
    unint64_t v4 = 12;
  }
  else if ([v3 isEqualToString:@"AnnotationTypeNER"])
  {
    unint64_t v4 = 13;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)describeAnnotationType:(unint64_t)a3
{
  if (a3 - 1 > 0xC) {
    return @"AnnotationTypeUnknown";
  }
  else {
    return off_1E65BA3E8[a3 - 1];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end