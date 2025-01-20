@interface SKTransition
+ (SKTransition)crossFadeWithDuration:(NSTimeInterval)sec;
+ (SKTransition)doorsCloseHorizontalWithDuration:(NSTimeInterval)sec;
+ (SKTransition)doorsCloseVerticalWithDuration:(NSTimeInterval)sec;
+ (SKTransition)doorsOpenHorizontalWithDuration:(NSTimeInterval)sec;
+ (SKTransition)doorsOpenVerticalWithDuration:(NSTimeInterval)sec;
+ (SKTransition)doorwayWithDuration:(NSTimeInterval)sec;
+ (SKTransition)fadeWithColor:(UIColor *)color duration:(NSTimeInterval)sec;
+ (SKTransition)fadeWithDuration:(NSTimeInterval)sec;
+ (SKTransition)flipHorizontalWithDuration:(NSTimeInterval)sec;
+ (SKTransition)flipVerticalWithDuration:(NSTimeInterval)sec;
+ (SKTransition)moveInWithDirection:(SKTransitionDirection)direction duration:(NSTimeInterval)sec;
+ (SKTransition)pushWithDirection:(SKTransitionDirection)direction duration:(NSTimeInterval)sec;
+ (SKTransition)revealWithDirection:(SKTransitionDirection)direction duration:(NSTimeInterval)sec;
+ (SKTransition)transitionWithCIFilter:(CIFilter *)filter duration:(NSTimeInterval)sec;
+ (id)moveInDownWithDuration:(double)a3;
+ (id)moveInLeftWithDuration:(double)a3;
+ (id)moveInRightWithDuration:(double)a3;
+ (id)moveInUpWithDuration:(double)a3;
+ (id)pushDownWithDuration:(double)a3;
+ (id)pushLeftWithDuration:(double)a3;
+ (id)pushRightWithDuration:(double)a3;
+ (id)pushUpWithDuration:(double)a3;
+ (id)revealDownWithDuration:(double)a3;
+ (id)revealLeftWithDuration:(double)a3;
+ (id)revealRightWithDuration:(double)a3;
+ (id)revealUpWithDuration:(double)a3;
- (BOOL)pausesIncomingScene;
- (BOOL)pausesOutgoingScene;
- (SKTransition)init;
- (double)_duration;
- (id)_filter;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_backingNode;
- (void)dealloc;
- (void)setPausesIncomingScene:(BOOL)pausesIncomingScene;
- (void)setPausesOutgoingScene:(BOOL)pausesOutgoingScene;
@end

@implementation SKTransition

- (SKTransition)init
{
  v3.receiver = self;
  v3.super_class = (Class)SKTransition;
  if ([(SKTransition *)&v3 init]) {
    operator new();
  }
  return 0;
}

+ (SKTransition)revealWithDirection:(SKTransitionDirection)direction duration:(NSTimeInterval)sec
{
  switch(direction)
  {
    case SKTransitionDirectionUp:
      v6 = objc_msgSend(a1, "revealUpWithDuration:", sec, v4);
      goto LABEL_9;
    case SKTransitionDirectionDown:
      v6 = objc_msgSend(a1, "revealDownWithDuration:", sec, v4);
      goto LABEL_9;
    case SKTransitionDirectionRight:
      v6 = objc_msgSend(a1, "revealRightWithDuration:", sec, v4);
      goto LABEL_9;
    case SKTransitionDirectionLeft:
      v6 = objc_msgSend(a1, "revealLeftWithDuration:", sec, v4);
LABEL_9:
      break;
    default:
      v6 = 0;
      break;
  }
  return (SKTransition *)v6;
}

+ (SKTransition)moveInWithDirection:(SKTransitionDirection)direction duration:(NSTimeInterval)sec
{
  switch(direction)
  {
    case SKTransitionDirectionUp:
      v6 = objc_msgSend(a1, "moveInUpWithDuration:", sec, v4);
      goto LABEL_9;
    case SKTransitionDirectionDown:
      v6 = objc_msgSend(a1, "moveInDownWithDuration:", sec, v4);
      goto LABEL_9;
    case SKTransitionDirectionRight:
      v6 = objc_msgSend(a1, "moveInRightWithDuration:", sec, v4);
      goto LABEL_9;
    case SKTransitionDirectionLeft:
      v6 = objc_msgSend(a1, "moveInLeftWithDuration:", sec, v4);
LABEL_9:
      break;
    default:
      v6 = 0;
      break;
  }
  return (SKTransition *)v6;
}

+ (SKTransition)pushWithDirection:(SKTransitionDirection)direction duration:(NSTimeInterval)sec
{
  switch(direction)
  {
    case SKTransitionDirectionUp:
      v6 = objc_msgSend(a1, "pushUpWithDuration:", sec, v4);
      goto LABEL_9;
    case SKTransitionDirectionDown:
      v6 = objc_msgSend(a1, "pushDownWithDuration:", sec, v4);
      goto LABEL_9;
    case SKTransitionDirectionRight:
      v6 = objc_msgSend(a1, "pushRightWithDuration:", sec, v4);
      goto LABEL_9;
    case SKTransitionDirectionLeft:
      v6 = objc_msgSend(a1, "pushLeftWithDuration:", sec, v4);
LABEL_9:
      break;
    default:
      v6 = 0;
      break;
  }
  return (SKTransition *)v6;
}

+ (SKTransition)fadeWithDuration:(NSTimeInterval)sec
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 1;
  float v6 = sec;
  skcTransitionNode[145] = v6;
  long long v8 = xmmword_20AE9A910;
  (*(void (**)(float *, long long *))(*(void *)skcTransitionNode + 184))(skcTransitionNode, &v8);

  return v4;
}

+ (SKTransition)fadeWithColor:(UIColor *)color duration:(NSTimeInterval)sec
{
  uint64_t v5 = color;
  float v6 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v6->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 1;
  float v8 = sec;
  skcTransitionNode[145] = v8;
  [(UIColor *)v5 vectorRGBA];
  long long v11 = v9;
  (*(void (**)(float *, long long *))(*(void *)skcTransitionNode + 184))(skcTransitionNode, &v11);

  return v6;
}

+ (SKTransition)crossFadeWithDuration:(NSTimeInterval)sec
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  skcTransitionNode[140] = 0.0;
  float v6 = sec;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (SKTransition)flipHorizontalWithDuration:(NSTimeInterval)sec
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 3;
  float v6 = sec;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (SKTransition)flipVerticalWithDuration:(NSTimeInterval)sec
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 2;
  float v6 = sec;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (id)revealUpWithDuration:(double)a3
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 4;
  float v6 = a3;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (id)revealDownWithDuration:(double)a3
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 5;
  float v6 = a3;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (id)revealLeftWithDuration:(double)a3
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 7;
  float v6 = a3;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (id)revealRightWithDuration:(double)a3
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 6;
  float v6 = a3;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (id)moveInUpWithDuration:(double)a3
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 8;
  float v6 = a3;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (id)moveInDownWithDuration:(double)a3
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 9;
  float v6 = a3;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (id)moveInLeftWithDuration:(double)a3
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 11;
  float v6 = a3;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (id)moveInRightWithDuration:(double)a3
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 10;
  float v6 = a3;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (id)pushUpWithDuration:(double)a3
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 12;
  float v6 = a3;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (id)pushDownWithDuration:(double)a3
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 13;
  float v6 = a3;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (id)pushLeftWithDuration:(double)a3
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 15;
  float v6 = a3;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (id)pushRightWithDuration:(double)a3
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 14;
  float v6 = a3;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (SKTransition)doorsOpenHorizontalWithDuration:(NSTimeInterval)sec
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 17;
  float v6 = sec;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (SKTransition)doorsOpenVerticalWithDuration:(NSTimeInterval)sec
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 16;
  float v6 = sec;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (SKTransition)doorsCloseHorizontalWithDuration:(NSTimeInterval)sec
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 19;
  float v6 = sec;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (SKTransition)doorsCloseVerticalWithDuration:(NSTimeInterval)sec
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 18;
  float v6 = sec;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (SKTransition)doorwayWithDuration:(NSTimeInterval)sec
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v4->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 20;
  float v6 = sec;
  skcTransitionNode[145] = v6;

  return v4;
}

+ (SKTransition)transitionWithCIFilter:(CIFilter *)filter duration:(NSTimeInterval)sec
{
  uint64_t v5 = filter;
  float v6 = objc_alloc_init(SKTransition);
  skcTransitionNode = (float *)v6->_skcTransitionNode;
  *((_DWORD *)skcTransitionNode + 140) = 21;
  float v8 = sec;
  skcTransitionNode[145] = v8;
  uint64_t v9 = [(CIFilter *)v5 copy];
  v10 = v6->_skcTransitionNode;
  long long v11 = (void *)v10[71];
  v10[71] = v9;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(SKTransition);
  skcTransitionNode = self->_skcTransitionNode;
  float v6 = v4->_skcTransitionNode;
  *((_DWORD *)v6 + 140) = *((_DWORD *)skcTransitionNode + 140);
  *((_DWORD *)v6 + 145) = *((_DWORD *)skcTransitionNode + 145);
  objc_storeStrong((id *)v6 + 71, *((id *)skcTransitionNode + 71));
  v7 = v4->_skcTransitionNode;
  long long v9 = *((_OWORD *)self->_skcTransitionNode + 19);
  (*(void (**)(void *, long long *))(*(void *)v7 + 184))(v7, &v9);
  *((_WORD *)v4->_skcTransitionNode + 288) = *((_WORD *)self->_skcTransitionNode + 288);
  return v4;
}

- (void)setPausesIncomingScene:(BOOL)pausesIncomingScene
{
  *((unsigned char *)self->_skcTransitionNode + 577) = pausesIncomingScene;
}

- (BOOL)pausesIncomingScene
{
  return *((unsigned char *)self->_skcTransitionNode + 577);
}

- (void)setPausesOutgoingScene:(BOOL)pausesOutgoingScene
{
  *((unsigned char *)self->_skcTransitionNode + 576) = pausesOutgoingScene;
}

- (BOOL)pausesOutgoingScene
{
  return *((unsigned char *)self->_skcTransitionNode + 576);
}

- (double)_duration
{
  skcTransitionNode = (float *)self->_skcTransitionNode;
  if (skcTransitionNode) {
    return skcTransitionNode[145];
  }
  else {
    return 0.0;
  }
}

- (void)_backingNode
{
  return self->_skcTransitionNode;
}

- (id)_filter
{
  return *((id *)self->_skcTransitionNode + 71);
}

- (void)dealloc
{
  skcTransitionNode = self->_skcTransitionNode;
  if (skcTransitionNode)
  {
    (*(void (**)(void *, SEL))(*(void *)skcTransitionNode + 88))(skcTransitionNode, a2);
    self->_skcTransitionNode = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKTransition;
  [(SKTransition *)&v4 dealloc];
}

@end