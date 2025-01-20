@interface ATXHomeScreenStackConfig
+ (BOOL)supportsSecureCoding;
- (ATXHomeScreenPage)page;
- (ATXHomeScreenStackConfig)init;
- (ATXHomeScreenStackConfig)initWithCoder:(id)a3;
- (BOOL)allowsNewWidget;
- (BOOL)allowsSmartRotate;
- (BOOL)isAppPredictionPanel;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPinnedSuggestionsWidget;
- (BOOL)isPinnedWidget;
- (NSArray)widgets;
- (NSString)identifier;
- (id)compactDescription;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromDictionaryRepresentation:(id)a3;
- (int64_t)coordinateColumn;
- (int64_t)coordinateRow;
- (unint64_t)hash;
- (unint64_t)numberOfLeafIconSpots;
- (unint64_t)stackLayoutSize;
- (void)_updateWidgetBackpointers;
- (void)assignWidgetSpaceCoordinateWithRow:(int64_t)a3 column:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsNewWidget:(BOOL)a3;
- (void)setAllowsSmartRotate:(BOOL)a3;
- (void)setCoordinateColumn:(int64_t)a3;
- (void)setCoordinateRow:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setPage:(id)a3;
- (void)setStackLayoutSize:(unint64_t)a3;
- (void)setWidgets:(id)a3;
@end

@implementation ATXHomeScreenStackConfig

- (unint64_t)numberOfLeafIconSpots
{
  int v3 = [MEMORY[0x1E4F93B08] isiPad];
  unint64_t result = [(ATXHomeScreenStackConfig *)self stackLayoutSize];
  switch(result)
  {
    case 0uLL:
      if (v3) {
        return 1;
      }
      else {
        return 4;
      }
    case 1uLL:
      BOOL v5 = v3 == 0;
      unint64_t v6 = 8;
      unint64_t v7 = 2;
      goto LABEL_9;
    case 2uLL:
      BOOL v5 = v3 == 0;
      unint64_t v6 = 16;
      unint64_t v7 = 4;
      goto LABEL_9;
    case 3uLL:
      BOOL v5 = v3 == 0;
      unint64_t v6 = 24;
      unint64_t v7 = 6;
      goto LABEL_9;
    case 4uLL:
      BOOL v5 = v3 == 0;
      unint64_t v6 = 32;
      unint64_t v7 = 8;
LABEL_9:
      if (v5) {
        unint64_t result = v6;
      }
      else {
        unint64_t result = v7;
      }
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHomeScreenStackConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXHomeScreenStackConfig;
  v2 = [(ATXHomeScreenStackConfig *)&v6 init];
  int v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_allowsNewWidget = 256;
    v4 = v2;
  }

  return v3;
}

- (ATXHomeScreenStackConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXHomeScreenStackConfig;
  BOOL v5 = [(ATXHomeScreenStackConfig *)&v12 init];
  if (v5)
  {
    -[ATXHomeScreenStackConfig setAllowsSmartRotate:](v5, "setAllowsSmartRotate:", [v4 decodeBoolForKey:@"allowsSmartRotate"]);
    -[ATXHomeScreenStackConfig setAllowsNewWidget:](v5, "setAllowsNewWidget:", [v4 decodeBoolForKey:@"allowsNewWidget"]);
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"widgets"];
    [(ATXHomeScreenStackConfig *)v5 setWidgets:v9];

    -[ATXHomeScreenStackConfig setStackLayoutSize:](v5, "setStackLayoutSize:", [v4 decodeIntegerForKey:@"stackLayoutSize"]);
    -[ATXHomeScreenStackConfig setCoordinateRow:](v5, "setCoordinateRow:", [v4 decodeIntegerForKey:@"coordinateRow"]);
    -[ATXHomeScreenStackConfig setCoordinateColumn:](v5, "setCoordinateColumn:", [v4 decodeIntegerForKey:@"coordinateColumn"]);
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(ATXHomeScreenStackConfig *)v5 setIdentifier:v10];
  }
  return v5;
}

- (void)_updateWidgetBackpointers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v3 = self->_widgets;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        v9 = [(ATXHomeScreenStackConfig *)self page];
        [v8 setPage:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)setPage:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_page, obj);
    [(ATXHomeScreenStackConfig *)self _updateWidgetBackpointers];
    uint64_t v5 = obj;
  }
}

- (void)setWidgets:(id)a3
{
  if (self->_widgets != a3)
  {
    uint64_t v4 = (NSArray *)[a3 copy];
    widgets = self->_widgets;
    self->_widgets = v4;

    [(ATXHomeScreenStackConfig *)self _updateWidgetBackpointers];
  }
}

- (void)assignWidgetSpaceCoordinateWithRow:(int64_t)a3 column:(int64_t)a4
{
  char v7 = [MEMORY[0x1E4F93B08] isiPad] ^ 1;
  [(ATXHomeScreenStackConfig *)self setCoordinateRow:a3 << v7];

  [(ATXHomeScreenStackConfig *)self setCoordinateColumn:a4 << v7];
}

- (BOOL)isPinnedWidget
{
  return !self->_allowsSmartRotate && !self->_allowsNewWidget && [(NSArray *)self->_widgets count] == 1;
}

- (BOOL)isPinnedSuggestionsWidget
{
  BOOL v3 = [(ATXHomeScreenStackConfig *)self isPinnedWidget];
  if (v3)
  {
    uint64_t v4 = [(NSArray *)self->_widgets firstObject];
    uint64_t v5 = [v4 extensionBundleId];
    char v6 = [v5 isEqualToString:*MEMORY[0x1E4F4B5F8]];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isAppPredictionPanel
{
  BOOL v3 = [(ATXHomeScreenStackConfig *)self isPinnedWidget];
  if (v3)
  {
    uint64_t v4 = [(NSArray *)self->_widgets firstObject];
    uint64_t v5 = [v4 extensionBundleId];
    char v6 = [v5 isEqualToString:@"com.apple.proactive.appprediction.panel"];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[ATXHomeScreenStackConfig allowsNewWidget](self, "allowsNewWidget"), @"allowsNewWidget");
  objc_msgSend(v4, "encodeBool:forKey:", -[ATXHomeScreenStackConfig allowsSmartRotate](self, "allowsSmartRotate"), @"allowsSmartRotate");
  uint64_t v5 = [(ATXHomeScreenStackConfig *)self widgets];
  [v4 encodeObject:v5 forKey:@"widgets"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXHomeScreenStackConfig stackLayoutSize](self, "stackLayoutSize"), @"stackLayoutSize");
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXHomeScreenStackConfig coordinateRow](self, "coordinateRow"), @"coordinateRow");
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXHomeScreenStackConfig coordinateColumn](self, "coordinateColumn"), @"coordinateColumn");
  id v6 = [(ATXHomeScreenStackConfig *)self identifier];
  [v4 encodeObject:v6 forKey:@"identifier"];
}

- (unint64_t)hash
{
  BOOL v3 = [(ATXHomeScreenStackConfig *)self identifier];
  uint64_t v4 = [v3 hash];

  return [(ATXHomeScreenStackConfig *)self stackLayoutSize] - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXHomeScreenStackConfig *)a3;
  if (self == v4)
  {
    char v11 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v11 = 0;
    goto LABEL_14;
  }
  uint64_t v5 = v4;
  if (self->_allowsNewWidget != [(ATXHomeScreenStackConfig *)v5 allowsNewWidget]
    || self->_allowsSmartRotate != [(ATXHomeScreenStackConfig *)v5 allowsSmartRotate]
    || [(ATXHomeScreenStackConfig *)v5 stackLayoutSize] != self->_stackLayoutSize
    || [(ATXHomeScreenStackConfig *)v5 coordinateRow] != self->_coordinateRow
    || [(ATXHomeScreenStackConfig *)v5 coordinateColumn] != self->_coordinateColumn)
  {
    goto LABEL_10;
  }
  widgets = self->_widgets;
  char v7 = v5->_widgets;
  if (widgets == v7)
  {

    goto LABEL_16;
  }
  v8 = v7;
  v9 = widgets;
  char v10 = [(NSArray *)v9 isEqual:v8];

  if (v10)
  {
LABEL_16:
    long long v13 = self->_identifier;
    v14 = v13;
    if (v13 == v5->_identifier) {
      char v11 = 1;
    }
    else {
      char v11 = -[NSString isEqual:](v13, "isEqual:");
    }

    goto LABEL_11;
  }
LABEL_10:
  char v11 = 0;
LABEL_11:

LABEL_14:
  return v11;
}

- (id)description
{
  BOOL v3 = objc_opt_new();
  [v3 appendFormat:@"Identifier: %@;", self->_identifier];
  objc_msgSend(v3, "appendFormat:", @"Allows new widget: %d; ", self->_allowsNewWidget);
  objc_msgSend(v3, "appendFormat:", @"Allows smart rotate: %d; ", self->_allowsSmartRotate);
  [v3 appendFormat:@"Widgets: %@; ", self->_widgets];
  objc_msgSend(v3, "appendFormat:", @"Layout size: %lu; ", self->_stackLayoutSize);
  [v3 appendFormat:@"Row: %lu, Column: %lu; ", self->_coordinateRow, self->_coordinateColumn];

  return v3;
}

- (id)compactDescription
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  [v3 appendFormat:@"Id: %@; ", self->_identifier];
  objc_msgSend(v3, "appendFormat:", @"N+1?: %d; ", self->_allowsNewWidget);
  objc_msgSend(v3, "appendFormat:", @"Rotation?: %d; ", self->_allowsSmartRotate);
  [v3 appendFormat:@"Widgets:[\n"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v14 = self;
  id obj = self->_widgets;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v9 = [v8 extensionBundleId];
        char v10 = [v8 widgetKind];
        char v11 = [v8 intent];
        long long v12 = [v8 widgetUniqueId];
        [v3 appendFormat:@"  %@ : %@ : hasIntent=%d : %@\n", v9, v10, v11 != 0, v12];
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  [v3 appendFormat:@"]; "];
  objc_msgSend(v3, "appendFormat:", @"Layout size: %lu; ", v14->_stackLayoutSize);
  [v3 appendFormat:@"Row: %lu, Column: %lu; ", v14->_coordinateRow, v14->_coordinateColumn];

  return v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = self->_widgets;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
        [v4 addObject:v10];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  char v11 = [NSNumber numberWithBool:self->_allowsNewWidget];
  [v3 setObject:v11 forKeyedSubscript:@"allowsNewWidget"];

  long long v12 = [NSNumber numberWithBool:self->_allowsSmartRotate];
  [v3 setObject:v12 forKeyedSubscript:@"allowsSmartRotate"];

  [v3 setObject:v4 forKeyedSubscript:@"widgets"];
  long long v13 = [NSNumber numberWithUnsignedInteger:self->_stackLayoutSize];
  [v3 setObject:v13 forKeyedSubscript:@"stackLayoutSize"];

  v14 = [NSNumber numberWithInteger:self->_coordinateRow];
  [v3 setObject:v14 forKeyedSubscript:@"coordinateRow"];

  uint64_t v15 = [NSNumber numberWithInteger:self->_coordinateColumn];
  [v3 setObject:v15 forKeyedSubscript:@"coordinateColumn"];

  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  long long v16 = (void *)[v3 copy];

  return v16;
}

- (id)initFromDictionaryRepresentation:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ATXHomeScreenStackConfig;
  uint64_t v5 = [(ATXHomeScreenStackConfig *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"allowsNewWidget"];
    v5->_allowsNewWidget = [v6 BOOLValue];

    uint64_t v7 = [v4 objectForKeyedSubscript:@"allowsSmartRotate"];
    v5->_allowsSmartRotate = [v7 BOOLValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"stackLayoutSize"];
    v5->_stackLayoutSize = [v8 unsignedIntegerValue];

    v9 = [v4 objectForKeyedSubscript:@"coordinateRow"];
    v5->_coordinateRow = [v9 unsignedIntegerValue];

    char v10 = [v4 objectForKeyedSubscript:@"coordinateColumn"];
    v5->_coordinateColumn = [v10 unsignedIntegerValue];

    uint64_t v11 = [v4 objectForKeyedSubscript:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

    long long v13 = [v4 objectForKeyedSubscript:@"widgets"];
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v25 + 1) + 8 * v19);
          long long v21 = [ATXHomeScreenWidgetIdentifiable alloc];
          id v22 = -[ATXHomeScreenWidgetIdentifiable initFromDictionaryRepresentation:](v21, "initFromDictionaryRepresentation:", v20, (void)v25);
          if (v22) {
            [v14 addObject:v22];
          }

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v17);
    }

    [(ATXHomeScreenStackConfig *)v5 setWidgets:v14];
    uint64_t v23 = v5;
  }
  return v5;
}

- (BOOL)allowsNewWidget
{
  return self->_allowsNewWidget;
}

- (void)setAllowsNewWidget:(BOOL)a3
{
  self->_allowsNewWidget = a3;
}

- (BOOL)allowsSmartRotate
{
  return self->_allowsSmartRotate;
}

- (void)setAllowsSmartRotate:(BOOL)a3
{
  self->_allowsSmartRotate = a3;
}

- (NSArray)widgets
{
  return self->_widgets;
}

- (unint64_t)stackLayoutSize
{
  return self->_stackLayoutSize;
}

- (void)setStackLayoutSize:(unint64_t)a3
{
  self->_stackLayoutSize = a3;
}

- (int64_t)coordinateRow
{
  return self->_coordinateRow;
}

- (void)setCoordinateRow:(int64_t)a3
{
  self->_coordinateRow = a3;
}

- (int64_t)coordinateColumn
{
  return self->_coordinateColumn;
}

- (void)setCoordinateColumn:(int64_t)a3
{
  self->_coordinateColumn = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (ATXHomeScreenPage)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);

  return (ATXHomeScreenPage *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_page);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_widgets, 0);
}

@end