@interface GEOTextItem
- (GEOTextItem)init;
- (GEOTextItem)initWithPrimaryText:(id)a3;
- (GEOTextItem)initWithTextItem:(id)a3;
- (NSString)primaryText;
@end

@implementation GEOTextItem

- (GEOTextItem)init
{
  result = (GEOTextItem *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOTextItem)initWithPrimaryText:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOTextItem;
  v5 = [(GEOTextItem *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    primaryText = v5->_primaryText;
    v5->_primaryText = (NSString *)v6;
  }
  return v5;
}

- (GEOTextItem)initWithTextItem:(id)a3
{
  id v4 = (id *)a3;
  -[GEOPDTextItem primaryText](v4);
  v5 = (GEOTextItem *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    uint64_t v6 = -[GEOPDTextItem primaryText](v4);
    self = [(GEOTextItem *)self initWithPrimaryText:v6];

    v5 = self;
  }

  return v5;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (void).cxx_destruct
{
}

@end