@interface StocksSyncStock
- (BOOL)isIndex;
- (BOOL)shouldUseCompanyNameAsListName;
- (NSDictionary)dictionaryRepresentation;
- (NSString)compactListName;
- (NSString)companyName;
- (NSString)listName;
- (NSString)symbol;
- (NSString)type;
- (StocksSyncStock)initWithSymbol:(id)a3 companyName:(id)a4 listName:(id)a5 compactListName:(id)a6 type:(id)a7;
@end

@implementation StocksSyncStock

- (StocksSyncStock)initWithSymbol:(id)a3 companyName:(id)a4 listName:(id)a5 compactListName:(id)a6 type:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)StocksSyncStock;
  v17 = [(StocksSyncStock *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_symbol, a3);
    objc_storeStrong((id *)&v18->_companyName, a4);
    objc_storeStrong((id *)&v18->_listName, a5);
    objc_storeStrong((id *)&v18->_compactListName, a6);
    objc_storeStrong((id *)&v18->_type, a7);
  }

  return v18;
}

- (BOOL)shouldUseCompanyNameAsListName
{
  unsigned __int8 v3 = [(NSString *)self->_companyName naui_containsCJKScripts];
  LODWORD(v4) = [(StocksSyncStock *)self isIndex];
  if ((v3 & 1) != 0 || v4)
  {
    NSUInteger v4 = [(NSString *)self->_companyName length];
    if (v4) {
      LOBYTE(v4) = [(NSString *)self->_companyName length] < 8;
    }
  }
  return v4;
}

- (NSString)listName
{
  unsigned __int8 v3 = [(StocksSyncStock *)self shouldUseCompanyNameAsListName];
  NSUInteger v4 = self->_companyName;
  if ((v3 & 1) == 0)
  {
    if ([(NSString *)self->_listName length])
    {
      unint64_t v5 = [(NSString *)self->_listName length];
      if (v5 < [(NSString *)v4 length])
      {
        v6 = self->_listName;

        NSUInteger v4 = v6;
      }
    }
    if ([(NSString *)self->_compactListName length])
    {
      unint64_t v7 = [(NSString *)self->_compactListName length];
      if (v7 < [(NSString *)v4 length])
      {
        v8 = self->_compactListName;

        NSUInteger v4 = v8;
      }
    }
    NSUInteger v9 = [(NSString *)v4 length];
    symbol = v4;
    if (!v9) {
      symbol = self->_symbol;
    }
    v11 = symbol;

    NSUInteger v4 = v11;
  }

  return v4;
}

- (BOOL)isIndex
{
  return [@"index" isEqualToString:self->_type];
}

- (NSDictionary)dictionaryRepresentation
{
  symbol = self->_symbol;
  NSUInteger v4 = +[StocksSyncPreferenceKeys symbol];
  type = self->_type;
  v6 = +[StocksSyncPreferenceKeys type];
  unint64_t v7 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", symbol, v4, type, v6, 0);

  listName = self->_listName;
  if (listName)
  {
    NSUInteger v9 = +[StocksSyncPreferenceKeys listName];
    [v7 setObject:listName forKeyedSubscript:v9];
  }
  compactListName = self->_compactListName;
  if (compactListName)
  {
    v11 = +[StocksSyncPreferenceKeys compactListName];
    [v7 setObject:compactListName forKeyedSubscript:v11];
  }
  companyName = self->_companyName;
  if (companyName)
  {
    id v13 = +[StocksSyncPreferenceKeys companyName];
    [v7 setObject:companyName forKeyedSubscript:v13];
  }
  id v14 = [v7 copy];

  return (NSDictionary *)v14;
}

- (NSString)symbol
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)companyName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)compactListName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_compactListName, 0);
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_symbol, 0);

  objc_storeStrong((id *)&self->_listName, 0);
}

@end