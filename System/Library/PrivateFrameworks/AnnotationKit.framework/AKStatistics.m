@interface AKStatistics
+ (id)nameForAnnotation:(id)a3;
+ (id)nameForClassName:(id)a3;
- (NSCountedSet)annotationsCounts;
- (NSString)clientPrefix;
- (NSString)documentType;
- (void)_logCoreAnalyticsAction:(id)a3;
- (void)_logCoreAnalyticsAnnotationCreateActionForAnnotationType:(id)a3 count:(unint64_t)a4;
- (void)_logCoreAnalyticsHUDPickActionForAnnotationType:(id)a3;
- (void)logAnnotationAdded:(id)a3;
- (void)logDocumentSaved;
- (void)logInkAnnotationStrokeAdded:(id)a3;
- (void)logShapeDetectionHUDPickedShape:(id)a3;
- (void)logShapeDetectionHUDShown;
- (void)resetLogging;
- (void)setAnnotationsCounts:(id)a3;
- (void)setClientPrefix:(id)a3;
- (void)setDocumentType:(id)a3;
@end

@implementation AKStatistics

- (void)resetLogging
{
  id v3 = [MEMORY[0x263F08760] set];
  [(AKStatistics *)self setAnnotationsCounts:v3];
}

- (void)logAnnotationAdded:(id)a3
{
  id v10 = a3;
  v4 = [(AKStatistics *)self annotationsCounts];

  if (v4)
  {
    uint64_t v5 = [(AKStatistics *)self clientPrefix];
    if (!v5
      || (v6 = (void *)v5,
          [(AKStatistics *)self documentType],
          v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          !v7))
    {
      NSLog(&cfstr_WarningMissing.isa);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = [(id)objc_opt_class() nameForAnnotation:v10];
        v9 = [(AKStatistics *)self annotationsCounts];
        [v9 addObject:v8];
      }
    }
  }
}

- (void)logInkAnnotationStrokeAdded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AKStatistics *)self clientPrefix];
  if (!v5
    || (v6 = (void *)v5,
        [(AKStatistics *)self documentType],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    NSLog(&cfstr_WarningMissing.isa);
  }
  id v9 = [(id)objc_opt_class() nameForClassName:v4];

  v8 = [(AKStatistics *)self annotationsCounts];
  [v8 addObject:v9];
}

- (void)_logCoreAnalyticsAction:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

- (void)_logCoreAnalyticsHUDPickActionForAnnotationType:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

- (void)_logCoreAnalyticsAnnotationCreateActionForAnnotationType:(id)a3 count:(unint64_t)a4
{
  id v5 = a3;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

- (void)logShapeDetectionHUDShown
{
  uint64_t v3 = [(AKStatistics *)self clientPrefix];
  if (!v3
    || (id v4 = (void *)v3,
        [(AKStatistics *)self documentType],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    NSLog(&cfstr_WarningMissing.isa);
  }

  [(AKStatistics *)self _logCoreAnalyticsAction:@"shapeDetectionShown"];
}

- (void)logShapeDetectionHUDPickedShape:(id)a3
{
  id v4 = a3;
  id v8 = [(id)objc_opt_class() nameForAnnotation:v4];

  uint64_t v5 = [(AKStatistics *)self clientPrefix];
  if (!v5
    || (v6 = (void *)v5,
        [(AKStatistics *)self documentType],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    NSLog(&cfstr_WarningMissing.isa);
  }
  [(AKStatistics *)self _logCoreAnalyticsHUDPickActionForAnnotationType:v8];
}

- (void)logDocumentSaved
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AKStatistics *)self clientPrefix];
  if (!v3
    || (id v4 = (void *)v3,
        [(AKStatistics *)self documentType],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    NSLog(&cfstr_WarningMissing.isa);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = [(AKStatistics *)self annotationsCounts];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        v12 = [(AKStatistics *)self annotationsCounts];
        uint64_t v13 = [v12 countForObject:v11];

        [(AKStatistics *)self _logCoreAnalyticsAnnotationCreateActionForAnnotationType:v11 count:v13];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(AKStatistics *)self _logCoreAnalyticsAction:@"save"];
}

+ (id)nameForClassName:(id)a3
{
  uint64_t v3 = [a3 stringByReplacingOccurrencesOfString:@"AK" withString:&stru_26EA57918];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"Annotation" withString:&stru_26EA57918];

  return v4;
}

+ (id)nameForAnnotation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [(id)objc_opt_class() nameForClassName:v5];
LABEL_4:
    uint64_t v7 = (__CFString *)v6;
    goto LABEL_5;
  }
  id v5 = v3;
  uint64_t v9 = [v5 arrowHeadStyle];
  if ((unint64_t)(v9 - 1) < 2)
  {
    uint64_t v7 = @"SingleArrow";
  }
  else if (v9)
  {
    if (v9 != 3)
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v10);
      goto LABEL_4;
    }
    uint64_t v7 = @"DoubleArrow";
  }
  else
  {
    uint64_t v7 = @"Line";
  }
LABEL_5:

  return v7;
}

- (NSString)documentType
{
  return self->_documentType;
}

- (void)setDocumentType:(id)a3
{
}

- (NSString)clientPrefix
{
  return self->_clientPrefix;
}

- (void)setClientPrefix:(id)a3
{
}

- (NSCountedSet)annotationsCounts
{
  return self->_annotationsCounts;
}

- (void)setAnnotationsCounts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationsCounts, 0);
  objc_storeStrong((id *)&self->_clientPrefix, 0);

  objc_storeStrong((id *)&self->_documentType, 0);
}

@end