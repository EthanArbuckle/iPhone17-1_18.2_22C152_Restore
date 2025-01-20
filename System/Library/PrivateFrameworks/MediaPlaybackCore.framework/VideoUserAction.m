@interface VideoUserAction
- (MFTimeStamp)timeStamp;
- (int64_t)source;
- (int64_t)type;
- (void)setSource:(int64_t)a3;
- (void)setTimeStamp:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation VideoUserAction

- (int64_t)type
{
  return *(void *)self->type;
}

- (void)setType:(int64_t)a3
{
  *(void *)self->type = a3;
}

- (MFTimeStamp)timeStamp
{
  v2 = (void *)swift_unknownObjectRetain();

  return (MFTimeStamp *)v2;
}

- (void)setTimeStamp:(id)a3
{
  *(void *)self->timeStamp = a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (int64_t)source
{
  return *(void *)self->source;
}

- (void)setSource:(int64_t)a3
{
  *(void *)self->source = a3;
}

@end