@interface NSDirInfoSerializer
- (unint64_t)serializePListValueIn:(id)a3 key:(id)a4 value:(id)a5;
@end

@implementation NSDirInfoSerializer

- (unint64_t)serializePListValueIn:(id)a3 key:(id)a4 value:(id)a5
{
  uint64_t v7 = objc_msgSend(self->super.ss, "writeInt:", *((void *)a5 + 1), a4);
  uint64_t v8 = [self->super.ss writeInt:*((unsigned __int16 *)a5 + 8)] + v7;
  uint64_t v9 = v8 + [self->super.ss writeInt:*((_WORD *)a5 + 9) & 7];
  return v9 + [self->super.ss writeInt:((unint64_t)*((unsigned __int16 *)a5 + 9) >> 1) & 1];
}

@end