@interface MUWebBasedPlacecardExpansionContext
- (NSDictionary)context;
- (NSNumber)height;
- (NSNumber)progress;
- (void)setHeight:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation MUWebBasedPlacecardExpansionContext

- (NSDictionary)context
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(MUWebBasedPlacecardExpansionContext *)self progress];
  [v3 setObject:v4 forKeyedSubscript:@"progress"];

  v5 = [(MUWebBasedPlacecardExpansionContext *)self height];
  [v3 setObject:v5 forKeyedSubscript:@"height"];

  v6 = (void *)[v3 copy];
  return (NSDictionary *)v6;
}

- (NSNumber)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSNumber)height
{
  return self->_height;
}

- (void)setHeight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

@end