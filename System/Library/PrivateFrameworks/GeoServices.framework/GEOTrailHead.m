@interface GEOTrailHead
+ (id)trailsFromProtos:(id)a3;
+ (int)_convertedDisplayType:(int)a3;
- (GEOTrailHead)initWithTrailHead:(id)a3;
- (NSArray)trails;
- (int)displayType;
- (unint64_t)numberOfInlineItems;
@end

@implementation GEOTrailHead

- (GEOTrailHead)initWithTrailHead:(id)a3
{
  v4 = (id *)a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOTrailHead;
  v5 = [(GEOTrailHead *)&v13 init];
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = -[GEOPDTrailHead trails](v4);
    uint64_t v8 = [v6 trailsFromProtos:v7];
    trails = v5->_trails;
    v5->_trails = (NSArray *)v8;

    v10 = objc_opt_class();
    v5->_displayType = [v10 _convertedDisplayType:-[GEOPDTrailHead hikingDisplayType]((uint64_t)v4)];
    if (v4) {
      unint64_t v11 = *((unsigned int *)v4 + 14);
    }
    else {
      unint64_t v11 = 0;
    }
    v5->_numberOfInlineItems = v11;
  }

  return v5;
}

+ (int)_convertedDisplayType:(int)a3
{
  return a3 != 1;
}

+ (id)trailsFromProtos:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v11 = [GEOTrail alloc];
        v12 = -[GEOTrail initWithTrail:](v11, "initWithTrail:", v10, (void)v14);
        if (v12) {
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSArray)trails
{
  return self->_trails;
}

- (int)displayType
{
  return self->_displayType;
}

- (unint64_t)numberOfInlineItems
{
  return self->_numberOfInlineItems;
}

- (void).cxx_destruct
{
}

@end