@interface NSDirInfoDeserializer
- (id)deserializePListValueIn:(id)a3 key:(id)a4 length:(unint64_t)a5;
@end

@implementation NSDirInfoDeserializer

- (id)deserializePListValueIn:(id)a3 key:(id)a4 length:(unint64_t)a5
{
  v6 = [+[NSDocInfo allocWithZone:[(NSDirInfoDeserializer *)self zone]] init];
  v6->time = (int)[self->super.ds readInt];
  v6->mode = [self->super.ds readInt];
  int v7 = [self->super.ds readInt];
  char v8 = [self->super.ds readInt];
  char v9 = v7 + 3;
  if (v7 >= 0) {
    char v9 = v7;
  }
  *(&v6->mode + 1) = *(&v6->mode + 1) & 0xFFF8 | v7 & 1 | v9 & 4 | (2 * (v8 & 1));
  return v6;
}

@end