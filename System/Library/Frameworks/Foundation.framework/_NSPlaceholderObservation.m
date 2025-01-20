@interface _NSPlaceholderObservation
- (_NSPlaceholderObservation)initWithObservable:(id)a3 blockSink:(id)a4 tag:(int)a5;
- (_NSPlaceholderObservation)initWithObservable:(id)a3 observer:(id)a4;
- (unint64_t)retainCount;
@end

@implementation _NSPlaceholderObservation

- (_NSPlaceholderObservation)initWithObservable:(id)a3 blockSink:(id)a4 tag:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  int v8 = [a3 conformsToProtocol:&unk_1ECACB5F0];
  v9 = off_1E51F4728;
  if (!v8) {
    v9 = off_1E51F46A0;
  }
  id v10 = objc_alloc(*v9);

  return (_NSPlaceholderObservation *)[v10 initWithObservable:a3 blockSink:a4 tag:v5];
}

- (_NSPlaceholderObservation)initWithObservable:(id)a3 observer:(id)a4
{
  int v6 = [a3 conformsToProtocol:&unk_1ECACB5F0];
  int v7 = [a4 conformsToProtocol:&unk_1ECACD308];
  if (v7) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && [a3 conformsToProtocol:&unk_1ECACD308]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Observable object %@ cannot also be an owning observer.", a3), 0 reason userInfo]);
  }
  int v9 = [a4 conformsToProtocol:&unk_1ECACB590];
  id v10 = off_1E51F46B0;
  if (v9) {
    id v10 = off_1E51F4720;
  }
  v11 = off_1E51F4730;
  if (v9) {
    v11 = off_1E51F4700;
  }
  if (v6) {
    id v10 = v11;
  }
  if (v9) {
    v12 = off_1E51F4738;
  }
  else {
    v12 = off_1E51F4740;
  }
  if (v7) {
    id v10 = v12;
  }
  id v13 = objc_alloc(*v10);

  return (_NSPlaceholderObservation *)[v13 initWithObservable:a3 observer:a4];
}

- (unint64_t)retainCount
{
  return -1;
}

@end