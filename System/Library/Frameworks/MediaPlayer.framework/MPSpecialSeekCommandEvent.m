@interface MPSpecialSeekCommandEvent
- (MPSpecialSeekCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5;
- (unint64_t)type;
@end

@implementation MPSpecialSeekCommandEvent

- (unint64_t)type
{
  return self->_type;
}

- (MPSpecialSeekCommandEvent)initWithCommand:(id)a3 mediaRemoteType:(unsigned int)a4 options:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MPSpecialSeekCommandEvent;
  result = [(MPRemoteCommandEvent *)&v8 initWithCommand:a3 mediaRemoteType:*(void *)&a4 options:a5];
  if (result)
  {
    if (a4 - 100 > 5) {
      unint64_t v7 = 0;
    }
    else {
      unint64_t v7 = qword_19568A118[a4 - 100];
    }
    result->_type = v7;
  }
  return result;
}

@end