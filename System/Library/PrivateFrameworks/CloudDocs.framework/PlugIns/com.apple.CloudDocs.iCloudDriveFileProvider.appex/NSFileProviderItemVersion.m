@interface NSFileProviderItemVersion
- (id)br_prettyDescription;
@end

@implementation NSFileProviderItemVersion

- (id)br_prettyDescription
{
  v3 = [(NSFileProviderItemVersion *)self contentVersion];
  if ([v3 length])
  {
    v4 = [BRFieldContentSignature alloc];
    v5 = [(NSFileProviderItemVersion *)self contentVersion];
    v6 = [(BRFieldContentSignature *)v4 initWithData:v5];
  }
  else
  {
    v6 = 0;
  }

  v7 = [(NSFileProviderItemVersion *)self metadataVersion];
  if ([v7 length])
  {
    v8 = [BRFieldStructureSignature alloc];
    v9 = [(NSFileProviderItemVersion *)self metadataVersion];
    v10 = [(BRFieldStructureSignature *)v8 initWithData:v9];
  }
  else
  {
    v10 = 0;
  }

  v11 = +[NSString stringWithFormat:@"[%@,%@]", v10, v6];

  return v11;
}

@end