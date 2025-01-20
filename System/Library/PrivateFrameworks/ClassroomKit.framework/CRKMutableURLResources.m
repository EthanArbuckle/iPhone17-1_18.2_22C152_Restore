@interface CRKMutableURLResources
- (void)setDirectory:(id)a3;
- (void)setDocumentIdentifier:(id)a3;
- (void)setLastModificationDate:(id)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation CRKMutableURLResources

- (void)setDirectory:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKURLResources *)self resources];
  [v5 setObject:v4 forKeyedSubscript:*MEMORY[0x263EFF6A8]];
}

- (void)setDocumentIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKURLResources *)self resources];
  [v5 setObject:v4 forKeyedSubscript:*MEMORY[0x263EFF620]];
}

- (void)setLastModificationDate:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKURLResources *)self resources];
  [v5 setObject:v4 forKeyedSubscript:*MEMORY[0x263EFF5F8]];
}

- (void)setSize:(unint64_t)a3
{
  id v5 = [NSNumber numberWithUnsignedLong:a3];
  id v4 = [(CRKURLResources *)self resources];
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263EFF688]];
}

@end