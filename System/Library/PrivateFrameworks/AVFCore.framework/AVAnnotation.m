@interface AVAnnotation
+ (id)annotationPropertyListToNonDataBindingsArray:(id)a3;
+ (void)initialize;
- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange;
- (AVAnnotation)initWithJSONData:(id)a3 representationBinaryDataBindings:(id)a4 error:(id *)a5;
- (AVAnnotation)initWithTimeRange:(id *)a3 normalizedBoundingBox:(CGRect)a4;
- (BOOL)isEqual:(id)a3;
- (CGRect)normalizedBoundingBox;
- (NSArray)representations;
- (NSDate)lastModifiedDate;
- (NSString)_version;
- (NSString)author;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)zOrder;
- (unint64_t)hash;
- (void)_setVersion:(id)a3;
- (void)dealloc;
- (void)getJSONData:(id *)a3 representationBinaryDataBindings:(id *)a4;
- (void)setAuthor:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setNormalizedBoundingBox:(CGRect)a3;
- (void)setRepresentations:(id)a3;
- (void)setTimeRange:(id *)a3;
- (void)setZOrder:(int64_t)a3;
@end

@implementation AVAnnotation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVAnnotation)initWithTimeRange:(id *)a3 normalizedBoundingBox:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)AVAnnotation;
  v9 = [(AVAnnotation *)&v13 init];
  if (v9)
  {
    *((void *)v9 + 1) = [@"AVAnnotationVersion_1" copy];
    *((void *)v9 + 2) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "copy");
    long long v11 = *(_OWORD *)&a3->var0.var3;
    long long v10 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v9 + 40) = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)(v9 + 56) = v11;
    *(_OWORD *)(v9 + 72) = v10;
    *((CGFloat *)v9 + 11) = x;
    *((CGFloat *)v9 + 12) = y;
    *((CGFloat *)v9 + 13) = width;
    *((CGFloat *)v9 + 14) = height;
    *((void *)v9 + 15) = 0;
  }
  return (AVAnnotation *)v9;
}

- (AVAnnotation)initWithJSONData:(id)a3 representationBinaryDataBindings:(id)a4 error:(id *)a5
{
  v69[1] = *MEMORY[0x1E4F143B8];
  v8 = [(AVAnnotation *)self init];
  v43 = 0;
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v43];
    if (v9)
    {
      long long v10 = (void *)v9;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v11 = (void *)[v10 objectForKey:@"AVAnnotationArchiveKeyVersion"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v8->_version = (NSString *)[v11 copy];
          [v11 isEqualToString:@"AVAnnotationVersion_1"];
          uint64_t v12 = [v10 objectForKey:@"AVAnnotationArchiveKeyIdentifier"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v8->_identifier = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
            uint64_t v13 = [v10 objectForKey:@"AVAnnotationArchiveKeyAuthor"];
            if (v13)
            {
              v14 = (void *)v13;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                uint64_t v62 = *MEMORY[0x1E4F28228];
                uint64_t v63 = [NSString stringWithFormat:@"Annotation data contains invalid format"];
                v38 = (void *)MEMORY[0x1E4F1C9E8];
                v39 = &v63;
                v40 = &v62;
                goto LABEL_41;
              }
              uint64_t v13 = [v14 copy];
            }
            v8->_author = (NSString *)v13;
            uint64_t v15 = [v10 objectForKey:@"AVAnnotationArchiveKeyLastModifiedDate"];
            if (!v15)
            {
LABEL_12:
              v8->_lastModifiedDate = (NSDate *)v15;
              CFDictionaryRef v17 = (const __CFDictionary *)[v10 objectForKey:@"AVAnnotationArchiveKeyTimeRange"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v41 = a5;
                CMTimeRangeMakeFromDictionary(&v42, v17);
                long long v19 = *(_OWORD *)&v42.start.epoch;
                long long v18 = *(_OWORD *)&v42.duration.timescale;
                *(_OWORD *)&v8->_timeRange.start.value = *(_OWORD *)&v42.start.value;
                *(_OWORD *)&v8->_timeRange.start.epoch = v19;
                *(_OWORD *)&v8->_timeRange.duration.timescale = v18;
                long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
                *(_OWORD *)&v42.start.value = *MEMORY[0x1E4F1DB20];
                *(_OWORD *)&v42.start.epoch = v20;
                CFDictionaryRef v21 = (const __CFDictionary *)[v10 objectForKey:@"AVAnnotationArchiveKeyNormalizedBoundingBox"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if (!CGRectMakeWithDictionaryRepresentation(v21, (CGRect *)&v42))
                  {
LABEL_30:
                    a5 = v41;
                    goto LABEL_31;
                  }
                  CGSize v22 = *(CGSize *)&v42.start.epoch;
                  v8->_normalizedBoundingBox.origin = *(CGPoint *)&v42.start.value;
                  v8->_normalizedBoundingBox.size = v22;
                  v23 = (void *)[v10 objectForKey:@"AVAnnotationArchiveKeyZOrder"];
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    v8->_zOrder = [v23 integerValue];
                    v24 = (void *)[v10 objectForKey:@"AVAnnotationArchiveKeyRepresentations"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v25 = [v24 count];
                      if (v25 == [a4 count])
                      {
                        v26 = (void *)[MEMORY[0x1E4F1CA48] array];
                        if (![v24 count])
                        {
LABEL_25:
                          v32 = v26;
                          v33 = v8;
                          v8->_representations = v32;
                          return v33;
                        }
                        uint64_t v27 = 0;
                        while (1)
                        {
                          uint64_t v28 = objc_msgSend(v24, "objectAtIndex:", v27, v41);
                          v29 = (void *)[a4 objectAtIndex:v27];
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            uint64_t v48 = *MEMORY[0x1E4F28228];
                            uint64_t v49 = [NSString stringWithFormat:@"Annotation data contains invalid format"];
                            v34 = (void *)MEMORY[0x1E4F1C9E8];
                            v35 = &v49;
                            v36 = &v48;
                            goto LABEL_29;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            uint64_t v46 = *MEMORY[0x1E4F28228];
                            uint64_t v47 = [NSString stringWithFormat:@"Annotation data contains invalid format"];
                            v34 = (void *)MEMORY[0x1E4F1C9E8];
                            v35 = &v47;
                            v36 = &v46;
                            goto LABEL_29;
                          }
                          uint64_t v30 = [v29 objectForKey:@"data"];
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0) {
                            goto LABEL_30;
                          }
                          id v31 = +[AVAnnotationRepresentation _annotationRepresentationWithPropertyList:v28 binaryData:v30];
                          if (!v31) {
                            break;
                          }
                          [v26 addObject:v31];
                          if ([v24 count] <= (unint64_t)++v27) {
                            goto LABEL_25;
                          }
                        }
                        uint64_t v44 = *MEMORY[0x1E4F28228];
                        uint64_t v45 = [NSString stringWithFormat:@"Annotation data contains invalid format"];
                        v34 = (void *)MEMORY[0x1E4F1C9E8];
                        v35 = &v45;
                        v36 = &v44;
                      }
                      else
                      {
                        uint64_t v50 = *MEMORY[0x1E4F28228];
                        uint64_t v51 = [NSString stringWithFormat:@"Annotation data contains invalid format"];
                        v34 = (void *)MEMORY[0x1E4F1C9E8];
                        v35 = &v51;
                        v36 = &v50;
                      }
                    }
                    else
                    {
                      uint64_t v52 = *MEMORY[0x1E4F28228];
                      uint64_t v53 = [NSString stringWithFormat:@"Annotation data contains invalid format"];
                      v34 = (void *)MEMORY[0x1E4F1C9E8];
                      v35 = &v53;
                      v36 = &v52;
                    }
                  }
                  else
                  {
                    uint64_t v54 = *MEMORY[0x1E4F28228];
                    uint64_t v55 = [NSString stringWithFormat:@"Annotation data contains invalid format"];
                    v34 = (void *)MEMORY[0x1E4F1C9E8];
                    v35 = &v55;
                    v36 = &v54;
                  }
                }
                else
                {
                  uint64_t v56 = *MEMORY[0x1E4F28228];
                  uint64_t v57 = [NSString stringWithFormat:@"Annotation data contains invalid format"];
                  v34 = (void *)MEMORY[0x1E4F1C9E8];
                  v35 = &v57;
                  v36 = &v56;
                }
LABEL_29:
                v43 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11821, objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, 1, v41));
                goto LABEL_30;
              }
              uint64_t v58 = *MEMORY[0x1E4F28228];
              uint64_t v59 = [NSString stringWithFormat:@"Annotation data contains invalid format"];
              v38 = (void *)MEMORY[0x1E4F1C9E8];
              v39 = &v59;
              v40 = &v58;
              goto LABEL_41;
            }
            uint64_t v16 = v15;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v15 = objc_msgSend((id)objc_msgSend(objc_alloc_init(MEMORY[0x1E4F28D48]), "dateFromString:", v16), "copy");
              goto LABEL_12;
            }
            uint64_t v60 = *MEMORY[0x1E4F28228];
            uint64_t v61 = [NSString stringWithFormat:@"Annotation data contains invalid format"];
            v38 = (void *)MEMORY[0x1E4F1C9E8];
            v39 = &v61;
            v40 = &v60;
          }
          else
          {
            uint64_t v64 = *MEMORY[0x1E4F28228];
            uint64_t v65 = [NSString stringWithFormat:@"Annotation data contains invalid format"];
            v38 = (void *)MEMORY[0x1E4F1C9E8];
            v39 = &v65;
            v40 = &v64;
          }
        }
        else
        {
          uint64_t v66 = *MEMORY[0x1E4F28228];
          uint64_t v67 = [NSString stringWithFormat:@"Annotation data contains invalid format"];
          v38 = (void *)MEMORY[0x1E4F1C9E8];
          v39 = &v67;
          v40 = &v66;
        }
      }
      else
      {
        uint64_t v68 = *MEMORY[0x1E4F28228];
        v69[0] = [NSString stringWithFormat:@"Annotation data contains invalid format"];
        v38 = (void *)MEMORY[0x1E4F1C9E8];
        v39 = v69;
        v40 = &v68;
      }
LABEL_41:
      v43 = (void *)AVLocalizedError(@"AVFoundationErrorDomain", -11821, (void *)[v38 dictionaryWithObjects:v39 forKeys:v40 count:1]);
    }
  }
LABEL_31:

  v33 = 0;
  if (a5) {
    *a5 = v43;
  }
  return v33;
}

- (void)getJSONData:(id *)a3 representationBinaryDataBindings:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v6, "setObject:forKey:", -[AVAnnotation _version](self, "_version"), @"AVAnnotationArchiveKeyVersion");
  objc_msgSend(v6, "setObject:forKey:", -[NSUUID UUIDString](-[AVAnnotation identifier](self, "identifier"), "UUIDString"), @"AVAnnotationArchiveKeyIdentifier");
  v7 = [(AVAnnotation *)self author];
  if (v7) {
    [v6 setObject:v7 forKey:@"AVAnnotationArchiveKeyAuthor"];
  }
  v8 = [(AVAnnotation *)self lastModifiedDate];
  if (v8)
  {
    uint64_t v9 = [objc_alloc_init(MEMORY[0x1E4F28D48]) stringFromDate:v8];
    if (v9) {
      [v6 setObject:v9 forKey:@"AVAnnotationArchiveKeyLastModifiedDate"];
    }
  }
  if (self) {
    [(AVAnnotation *)self timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  objc_msgSend(v6, "setObject:forKey:", CMTimeRangeCopyAsDictionary(&range, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]), @"AVAnnotationArchiveKeyTimeRange");
  [(AVAnnotation *)self normalizedBoundingBox];
  [v6 setObject:CGRectCreateDictionaryRepresentation(v37) forKey:@"AVAnnotationArchiveKeyNormalizedBoundingBox"];
  CGSize v22 = v6;
  objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AVAnnotation zOrder](self, "zOrder")), @"AVAnnotationArchiveKeyZOrder");
  long long v10 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v11 = [(AVAnnotation *)self representations];
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8 * v15);
        uint64_t v25 = 0;
        objc_msgSend(v10, "addObject:", objc_msgSend(v16, "_propertyListAndBinaryData:", &v25));
        if (v25)
        {
          v33[1] = @"identifier";
          v34[0] = v25;
          v33[0] = @"data";
          v34[1] = [v16 identifier];
          CFDictionaryRef v17 = (void *)MEMORY[0x1E4F1C9E8];
          long long v18 = v34;
          long long v19 = v33;
        }
        else
        {
          v31[0] = @"data";
          uint64_t v20 = [MEMORY[0x1E4F1C9B8] data];
          v31[1] = @"identifier";
          v32[0] = v20;
          v32[1] = [v16 identifier];
          CFDictionaryRef v17 = (void *)MEMORY[0x1E4F1C9E8];
          long long v18 = v32;
          long long v19 = v31;
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 2));
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v13);
  }
  [v22 setObject:v10 forKey:@"AVAnnotationArchiveKeyRepresentations"];
  CFDictionaryRef v21 = (void *)[MEMORY[0x1E4F28D90] dataWithJSONObject:v22 options:0 error:0];
  if (a3) {
    *a3 = v21;
  }
  if (a4) {
    *a4 = v5;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAnnotation;
  [(AVAnnotation *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  long long v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  v19[0] = *(_OWORD *)&self->_timeRange.start.value;
  v19[1] = v5;
  v19[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  v6 = objc_msgSend(v4, "initWithTimeRange:normalizedBoundingBox:", v19, self->_normalizedBoundingBox.origin.x, self->_normalizedBoundingBox.origin.y, self->_normalizedBoundingBox.size.width, self->_normalizedBoundingBox.size.height);
  if (v6)
  {
    objc_msgSend(v6, "setIdentifier:", -[AVAnnotation identifier](self, "identifier"));
    objc_msgSend(v6, "setAuthor:", -[AVAnnotation author](self, "author"));
    objc_msgSend(v6, "setLastModifiedDate:", -[AVAnnotation lastModifiedDate](self, "lastModifiedDate"));
    [(AVAnnotation *)self timeRange];
    [v6 setTimeRange:v18];
    objc_msgSend(v6, "setZOrder:", -[AVAnnotation zOrder](self, "zOrder"));
    v7 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = [(AVAnnotation *)self representations];
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v7, "addObject:", (id)objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12++), "copy"));
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v10);
    }
    [v6 setRepresentations:v7];
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v35 = v8;
    uint64_t v36 = v7;
    uint64_t v37 = v6;
    uint64_t v38 = v5;
    uint64_t v39 = v3;
    uint64_t v40 = v4;
    if (!a3) {
      goto LABEL_26;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
    if (-[NSString isEqualToString:](-[AVAnnotation _version](self, "_version"), "isEqualToString:", [a3 _version]))
    {
      int v11 = -[NSUUID isEqual:](-[AVAnnotation identifier](self, "identifier"), "isEqual:", [a3 identifier]);
    }
    else
    {
      int v11 = 0;
    }
    uint64_t v13 = [(AVAnnotation *)self author];
    uint64_t v14 = [a3 author];
    BOOL v15 = v13 == (NSString *)v14;
    if (v13 == (NSString *)v14) {
      BOOL v16 = v11;
    }
    else {
      BOOL v16 = 0;
    }
    if (!v15 && v11) {
      BOOL v16 = -[NSString isEqualToString:](-[AVAnnotation author](self, "author"), "isEqualToString:", [a3 author]);
    }
    long long v17 = [(AVAnnotation *)self lastModifiedDate];
    if (v17 == (NSDate *)[a3 lastModifiedDate])
    {
      if (!v16) {
        goto LABEL_26;
      }
    }
    else if (!v16 {
           || !-[NSDate isEqualToDate:](-[AVAnnotation lastModifiedDate](self, "lastModifiedDate"), "isEqualToDate:", [a3 lastModifiedDate]))
    }
    {
      goto LABEL_26;
    }
    if (self) {
      [(AVAnnotation *)self timeRange];
    }
    else {
      memset(&range1, 0, sizeof(range1));
    }
    [a3 timeRange];
    int v12 = CMTimeRangeEqual(&range1, &v33);
    if (v12)
    {
      [(AVAnnotation *)self normalizedBoundingBox];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      [a3 normalizedBoundingBox];
      v42.origin.CGFloat x = v26;
      v42.origin.CGFloat y = v27;
      v42.size.CGFloat width = v28;
      v42.size.CGFloat height = v29;
      v41.origin.CGFloat x = v19;
      v41.origin.CGFloat y = v21;
      v41.size.CGFloat width = v23;
      v41.size.CGFloat height = v25;
      int v12 = CGRectEqualToRect(v41, v42);
      if (v12)
      {
        int64_t v30 = [(AVAnnotation *)self zOrder];
        if (v30 == [a3 zOrder])
        {
          id v31 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[AVAnnotation representations](self, "representations"));
          LOBYTE(v12) = objc_msgSend(v31, "isEqualToSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "representations")));
          return v12;
        }
LABEL_26:
        LOBYTE(v12) = 0;
      }
    }
  }
  return v12;
}

- (unint64_t)hash
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSString *)[(AVAnnotation *)self _version] hash];
  uint64_t v4 = [(NSUUID *)[(AVAnnotation *)self identifier] hash];
  NSUInteger v5 = [(NSString *)[(AVAnnotation *)self author] hash];
  uint64_t v6 = [(NSDate *)[(AVAnnotation *)self lastModifiedDate] hash];
  memset(v24, 0, sizeof(v24));
  long long v23 = 0u;
  if (self) {
    [(AVAnnotation *)self timeRange];
  }
  *(_OWORD *)&v22.value = v23;
  v22.epoch = *(void *)&v24[0];
  CMTimeEpoch v7 = CMTimeHash(&v22);
  CMTime v22 = *(CMTime *)((char *)v24 + 8);
  CMTimeEpoch v8 = CMTimeHash(&v22);
  uint64_t v9 = (void *)MEMORY[0x1E4F29238];
  [(AVAnnotation *)self normalizedBoundingBox];
  uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "valueWithRect:"), "hash");
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AVAnnotation zOrder](self, "zOrder")), "hash");
  long long v20 = 0u;
  long long v21 = 0u;
  int v12 = [(AVAnnotation *)self representations];
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        v11 ^= [*(id *)(*((void *)&v18 + 1) + 8 * i) hash];
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v14);
  }
  return v11;
}

- (id)description
{
  NSUInteger v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p>", NSStringFromClass(v4), self];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (CGRect)normalizedBoundingBox
{
  double x = self->_normalizedBoundingBox.origin.x;
  double y = self->_normalizedBoundingBox.origin.y;
  double width = self->_normalizedBoundingBox.size.width;
  double height = self->_normalizedBoundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNormalizedBoundingBox:(CGRect)a3
{
  self->_normalizedBoundingBodouble x = a3;
}

- (int64_t)zOrder
{
  return self->_zOrder;
}

- (void)setZOrder:(int64_t)a3
{
  self->_zOrder = a3;
}

- (NSArray)representations
{
  return self->_representations;
}

- (void)setRepresentations:(id)a3
{
}

- (NSString)_version
{
  return self->_version;
}

- (void)_setVersion:(id)a3
{
  long long v4 = (NSString *)[a3 copy];

  self->_version = v4;
}

+ (id)annotationPropertyListToNonDataBindingsArray:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  NSUInteger v5 = (void *)[a3 objectForKey:@"AVAnnotationArchiveKeyRepresentations"];
  objc_opt_class();
  id obj = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) objectForKey:@"AVAnnotationArchiveKeyIdentifier"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        id v11 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
        long long v18 = @"identifier";
        id v19 = v11;
        objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
        if (v7 == ++v9)
        {
          uint64_t v7 = [obj countByEnumeratingWithState:&v14 objects:v20 count:16];
          if (v7) {
            goto LABEL_4;
          }
          return v4;
        }
      }
    }
  }
  return v4;
}

@end