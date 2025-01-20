@interface RTInferredMapItem
+ (BOOL)hasKnownTypeItem:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (double)consolidatedConfidenceFromConfidences:(id)a3;
+ (id)dedupeInferredMapItems:(id)a3;
+ (id)heaviestMapItemFrom:(id)a3 closestToLocation:(id)a4 distanceCalculator:(id)a5 error:(id *)a6;
+ (unint64_t)consolidatedSourceFromInferredMapItems:(id)a3;
- (BOOL)isEqual:(id)a3;
- (RTInferredMapItem)init;
- (RTInferredMapItem)initWithCoder:(id)a3;
- (RTInferredMapItem)initWithMapItem:(id)a3 confidence:(double)a4 source:(unint64_t)a5;
- (RTMapItem)mapItem;
- (double)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)source;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTInferredMapItem

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (unint64_t)source
{
  return self->_source;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
}

- (RTInferredMapItem)initWithMapItem:(id)a3 confidence:(double)a4 source:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTInferredMapItem initWithMapItem:confidence:source:]";
      __int16 v20 = 1024;
      int v21 = 47;
      _os_log_error_impl(&dword_1A8FEF000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem (in %s:%d)", buf, 0x12u);
    }
  }
  if (a4 < 0.0 || a4 > 1.0)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTInferredMapItem initWithMapItem:confidence:source:]";
      __int16 v20 = 1024;
      int v21 = 49;
      _os_log_error_impl(&dword_1A8FEF000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: kRTInferredMapItemConfidenceMin <= confidence && confidence <= kRTInferredMapItemConfidenceMax (in %s:%d)", buf, 0x12u);
    }
  }
  v13 = 0;
  if (v9 && a4 >= 0.0 && a4 <= 1.0 && (a5 & 0xFFFFFFFFFFF00020) == 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTInferredMapItem;
    v14 = [(RTInferredMapItem *)&v17 init];
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_mapItem, a3);
      v15->_confidence = a4;
      v15->_source = a5;
    }
    self = v15;
    v13 = self;
  }

  return v13;
}

- (RTInferredMapItem)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMapItem_confidence_source_);
}

- (id)description
{
  v3 = NSString;
  v4 = [(RTInferredMapItem *)self mapItem];
  [(RTInferredMapItem *)self confidence];
  uint64_t v6 = v5;
  v7 = +[RTMapItem sourceToString:[(RTInferredMapItem *)self source]];
  v8 = [v3 stringWithFormat:@"mapItem, %@, confidence, %.3f, source, %@", v4, v6, v7];

  return v8;
}

+ (BOOL)hasKnownTypeItem:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    BOOL v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_1] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t __38__RTInferredMapItem_hasKnownTypeItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 mapItem];
  id v3 = [v2 extendedAttributes];
  uint64_t v4 = [v3 isMe];

  return v4;
}

+ (double)consolidatedConfidenceFromConfidences:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = 0.0;
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      uint64_t v5 = [v3 firstObject];
      [v5 doubleValue];
      double v4 = v6;
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v7 = v3;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v22;
        double v11 = 1.0;
        double v12 = 1.0;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(v7);
            }
            v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            [v14 doubleValue];
            if (v15 < 0.0 || ([v14 doubleValue], v16 > 1.0))
            {
              objc_super v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v26 = v14;
                __int16 v27 = 2080;
                v28 = "+[RTInferredMapItem consolidatedConfidenceFromConfidences:]";
                __int16 v29 = 1024;
                int v30 = 117;
                _os_log_error_impl(&dword_1A8FEF000, v17, OS_LOG_TYPE_ERROR, "invalid confidence, %@ (in %s:%d)", buf, 0x1Cu);
              }
            }
            [v14 doubleValue];
            double v11 = v11 * v18;
            [v14 doubleValue];
            double v12 = v12 * (1.0 - v19);
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
        }
        while (v9);
      }
      else
      {
        double v11 = 1.0;
        double v12 = 1.0;
      }

      if (v11 + v12 != 0.0) {
        double v4 = fmax(fmin(v11 / (v11 + v12), 1.0), 0.0);
      }
    }
  }

  return v4;
}

+ (unint64_t)consolidatedSourceFromInferredMapItems:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= [*(id *)(*((void *)&v10 + 1) + 8 * i) source];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (id)dedupeInferredMapItems:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 1)
  {
    uint64_t v4 = (void *)[v3 copy];
    goto LABEL_37;
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v55 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v50 = v3;
  id v6 = v3;
  v51 = v6;
  uint64_t v54 = [v6 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (!v54) {
    goto LABEL_24;
  }
  uint64_t v7 = *(void *)v65;
  v52 = v5;
  uint64_t v53 = *(void *)v65;
  do
  {
    for (uint64_t i = 0; i != v54; ++i)
    {
      if (*(void *)v65 != v7) {
        objc_enumerationMutation(v6);
      }
      uint64_t v9 = *(void **)(*((void *)&v64 + 1) + 8 * i);
      long long v10 = objc_msgSend(v9, "mapItem", v50);
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __44__RTInferredMapItem_dedupeInferredMapItems___block_invoke;
      v62[3] = &unk_1E5D74360;
      id v11 = v10;
      id v63 = v11;
      uint64_t v12 = [v5 indexOfObjectPassingTest:v62];
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [v5 addObject:v11];
        long long v13 = [MEMORY[0x1E4F1CA48] arrayWithObject:v9];
        id v14 = [v11 identifier];
        [v55 setObject:v13 forKeyedSubscript:v14];
      }
      else
      {
        uint64_t v15 = v12;
        long long v13 = [v5 objectAtIndexedSubscript:v12];
        double v16 = [v13 identifier];
        objc_super v17 = [v55 objectForKeyedSubscript:v16];
        [v17 addObject:v9];

        uint64_t v18 = [v13 source];
        uint64_t v19 = [v11 source] & v18;
        if (v19 == [v11 source])
        {
          uint64_t v7 = v53;
          goto LABEL_22;
        }
        [v11 weight];
        double v21 = v20;
        [v13 weight];
        if (v21 <= v22) {
          long long v23 = v13;
        }
        else {
          long long v23 = v11;
        }
        id v14 = v23;
        if (v14 == v11) {
          long long v24 = v13;
        }
        else {
          long long v24 = v11;
        }
        id v25 = v24;
        v26 = objc_msgSend(v14, "appendSource:", objc_msgSend(v25, "source"));
        [v5 setObject:v26 atIndexedSubscript:v15];

        __int16 v27 = [v5 objectAtIndexedSubscript:v15];
        v28 = [v27 identifier];
        __int16 v29 = [v13 identifier];
        char v30 = [v28 isEqual:v29];

        if ((v30 & 1) == 0)
        {
          v31 = [v13 identifier];
          uint64_t v32 = [v55 objectForKeyedSubscript:v31];
          v33 = [v52 objectAtIndexedSubscript:v15];
          v34 = [v33 identifier];
          [v55 setObject:v32 forKeyedSubscript:v34];
        }
        id v6 = v51;
        uint64_t v5 = v52;
        uint64_t v7 = v53;
      }

LABEL_22:
    }
    uint64_t v54 = [v6 countByEnumeratingWithState:&v64 objects:v69 count:16];
  }
  while (v54);
LABEL_24:

  uint64_t v35 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v36 = v5;
  uint64_t v4 = (void *)v35;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v37 = v36;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v59 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v58 + 1) + 8 * j);
        v43 = objc_msgSend(v42, "identifier", v50);
        v44 = [v55 objectForKeyedSubscript:v43];

        if ([v44 count] == 1)
        {
          v45 = [v44 firstObject];
          [v4 addObject:v45];
        }
        else
        {
          v45 = [v44 valueForKeyPath:@"confidence"];
          [(id)objc_opt_class() consolidatedConfidenceFromConfidences:v45];
          v47 = -[RTInferredMapItem initWithMapItem:confidence:source:]([RTInferredMapItem alloc], "initWithMapItem:confidence:source:", v42, [(id)objc_opt_class() consolidatedSourceFromInferredMapItems:v44], v46);
          [v4 addObject:v47];
        }
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v39);
  }

  uint64_t v48 = [v51 count];
  if (v48 != [v4 count])
  {
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __44__RTInferredMapItem_dedupeInferredMapItems___block_invoke_2;
    v56[3] = &unk_1E5D74388;
    id v57 = v55;
    [v4 enumerateObjectsUsingBlock:v56];
  }
  id v3 = v50;
LABEL_37:

  return v4;
}

uint64_t __44__RTInferredMapItem_dedupeInferredMapItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isEqualToMapItem:*(void *)(a1 + 32)];
  if (result) {
    *a4 = 1;
  }
  return result;
}

void __44__RTInferredMapItem_dedupeInferredMapItems___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = a3 + 1;
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v5 mapItem];
    long long v10 = [v9 identifier];
    id v11 = [v8 objectForKeyedSubscript:v10];
    int v12 = 134218498;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    uint64_t v15 = [v11 count];
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_1A8FEF000, v6, OS_LOG_TYPE_INFO, "de-duped mapItem %lu (from %lu mapItems), %@", (uint8_t *)&v12, 0x20u);
  }
}

+ (id)heaviestMapItemFrom:(id)a3 closestToLocation:(id)a4 distanceCalculator:(id)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((unint64_t)[v9 count] > 1)
  {
    uint64_t v13 = [v9 valueForKeyPath:@"mapItem"];
    __int16 v14 = +[RTMapItem heaviestMapItemFrom:v13 closestToLocation:v10 distanceCalculator:v11 error:a6];
    if (*a6)
    {
      id v12 = 0;
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v15 = v9;
      id v12 = (id)[v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12)
      {
        double v21 = v13;
        uint64_t v16 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v15);
            }
            uint64_t v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            uint64_t v19 = [v18 mapItem];

            if (v19 == v14)
            {
              id v12 = v18;
              goto LABEL_15;
            }
          }
          id v12 = (id)[v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v12) {
            continue;
          }
          break;
        }
LABEL_15:
        uint64_t v13 = v21;
      }
    }
  }
  else
  {
    id v12 = [v9 firstObject];
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  mapItem = self->_mapItem;
  double confidence = self->_confidence;
  unint64_t source = self->_source;
  return (id)[v4 initWithMapItem:mapItem confidence:source source:confidence];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  mapItem = self->_mapItem;
  id v5 = a3;
  [v5 encodeObject:mapItem forKey:@"mapItem"];
  [v5 encodeDouble:@"confidence" forKey:self->_confidence];
  [v5 encodeInteger:self->_source forKey:@"source"];
}

- (RTInferredMapItem)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapItem"];
  [v4 decodeDoubleForKey:@"confidence"];
  double v7 = v6;
  uint64_t v8 = [v4 decodeIntegerForKey:@"source"];

  id v9 = [(RTInferredMapItem *)self initWithMapItem:v5 confidence:v8 source:v7];
  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(RTMapItem *)self->_mapItem hash];
  id v4 = [NSNumber numberWithDouble:self->_confidence];
  uint64_t v5 = [v4 hash] ^ v3;
  double v6 = [NSNumber numberWithUnsignedInteger:self->_source];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTInferredMapItem *)a3;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      double v6 = [(RTInferredMapItem *)self mapItem];
      unint64_t v7 = [(RTInferredMapItem *)v5 mapItem];
      char v8 = [v6 isEqual:v7];

      [(RTInferredMapItem *)self confidence];
      double v10 = v9;
      [(RTInferredMapItem *)v5 confidence];
      double v12 = v11;
      unint64_t v13 = [(RTInferredMapItem *)self source];
      uint64_t v14 = [(RTInferredMapItem *)v5 source];

      if (v10 == v12) {
        BOOL v15 = v8;
      }
      else {
        BOOL v15 = 0;
      }
      BOOL v16 = v13 == v14 && v15;
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

@end