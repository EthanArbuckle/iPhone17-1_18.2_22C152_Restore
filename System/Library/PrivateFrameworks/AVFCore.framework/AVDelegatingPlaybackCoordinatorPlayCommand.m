@interface AVDelegatingPlaybackCoordinatorPlayCommand
- (AVDelegatingPlaybackCoordinatorPlayCommand)init;
- (AVDelegatingPlaybackCoordinatorPlayCommand)initWithCoordinator:(id)a3 originator:(id)a4 expectedCurrentItemIdentifier:(id)a5 commandOrderIndex:(int64_t)a6 rate:(float)a7 itemTime:(id *)a8 hostClockTime:(id *)a9;
- (CMTime)hostClockTime;
- (CMTime)itemTime;
- (float)rate;
- (id)expectedCurrentItemIdentifier;
- (id)originator;
- (void)dealloc;
@end

@implementation AVDelegatingPlaybackCoordinatorPlayCommand

- (AVDelegatingPlaybackCoordinatorPlayCommand)init
{
  v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"-[AVDelegatingPlaybackCoordinatorPlayCommand init] unavailable", v2, v3, v4, v5, v6, v8), 0 reason userInfo];
  objc_exception_throw(v7);
}

- (AVDelegatingPlaybackCoordinatorPlayCommand)initWithCoordinator:(id)a3 originator:(id)a4 expectedCurrentItemIdentifier:(id)a5 commandOrderIndex:(int64_t)a6 rate:(float)a7 itemTime:(id *)a8 hostClockTime:(id *)a9
{
  v20.receiver = self;
  v20.super_class = (Class)AVDelegatingPlaybackCoordinatorPlayCommand;
  v16 = [(AVDelegatingPlaybackCoordinatorPlaybackControlCommand *)&v20 initInternal];
  if (v16)
  {
    *((void *)v16 + 1) = a3;
    *((void *)v16 + 2) = a4;
    *((void *)v16 + 3) = [a5 copy];
    *((void *)v16 + 4) = a6;
    *((float *)v16 + 10) = a7;
    long long v17 = *(_OWORD *)&a8->var0;
    *(void *)(v16 + 60) = a8->var3;
    *(_OWORD *)(v16 + 44) = v17;
    long long v18 = *(_OWORD *)&a9->var0;
    *(void *)(v16 + 84) = a9->var3;
    *(_OWORD *)(v16 + 68) = v18;
  }
  return (AVDelegatingPlaybackCoordinatorPlayCommand *)v16;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVDelegatingPlaybackCoordinatorPlayCommand;
  [(AVDelegatingPlaybackCoordinatorPlayCommand *)&v3 dealloc];
}

- (id)originator
{
  return self->_originator;
}

- (id)expectedCurrentItemIdentifier
{
  return self->_expectedCurrentItemIdentifier;
}

- (float)rate
{
  return self->_rate;
}

- (CMTime)itemTime
{
  *(_OWORD *)&retstr->value = *(_OWORD *)((char *)&self[1].epoch + 4);
  retstr->epoch = *(void *)&self[2].flags;
  return self;
}

- (CMTime)hostClockTime
{
  *(_OWORD *)&retstr->value = *(_OWORD *)((char *)&self[2].epoch + 4);
  retstr->epoch = *(void *)&self[3].flags;
  return self;
}

@end