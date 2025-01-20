@interface MRURoutingSubtitleController
- (BOOL)canTransitionToNextState;
- (BOOL)hasText;
- (MRURoutingSubtitleController)init;
- (MRURoutingSubtitleControllerDelegate)delegate;
- (NSMutableDictionary)storage;
- (NSString)text;
- (UIImage)icon;
- (id)description;
- (int64_t)accessory;
- (int64_t)nextAvailableTextState;
- (int64_t)state;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setStorage:(id)a3;
- (void)setText:(id)a3 forState:(int64_t)a4;
- (void)setText:(id)a3 forState:(int64_t)a4 accessory:(int64_t)a5;
- (void)setText:(id)a3 icon:(id)a4 forState:(int64_t)a5;
- (void)setText:(id)a3 icon:(id)a4 forState:(int64_t)a5 accessory:(int64_t)a6;
- (void)transitionToNextAvailableState;
@end

@implementation MRURoutingSubtitleController

- (MRURoutingSubtitleController)init
{
  v7.receiver = self;
  v7.super_class = (Class)MRURoutingSubtitleController;
  v2 = [(MRURoutingSubtitleController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v3->_storage;
    v3->_storage = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MRURoutingSubtitleController *)self storage];
  v6 = [v3 stringWithFormat:@"<%@: %p storage=%@ >", v4, self, v5];

  return v6;
}

- (BOOL)hasText
{
  return [(NSMutableDictionary *)self->_storage count] != 0;
}

- (NSString)text
{
  storage = self->_storage;
  v3 = [NSNumber numberWithInteger:self->_state];
  uint64_t v4 = [(NSMutableDictionary *)storage objectForKeyedSubscript:v3];
  v5 = [v4 text];
  v6 = (void *)[v5 copy];

  return (NSString *)v6;
}

- (UIImage)icon
{
  storage = self->_storage;
  v3 = [NSNumber numberWithInteger:self->_state];
  uint64_t v4 = [(NSMutableDictionary *)storage objectForKeyedSubscript:v3];
  v5 = [v4 icon];

  return (UIImage *)v5;
}

- (int64_t)accessory
{
  storage = self->_storage;
  v3 = [NSNumber numberWithInteger:self->_state];
  uint64_t v4 = [(NSMutableDictionary *)storage objectForKeyedSubscript:v3];
  int64_t v5 = [v4 accessory];

  return v5;
}

- (BOOL)canTransitionToNextState
{
  return [(MRURoutingSubtitleController *)self nextAvailableTextState] != self->_state;
}

- (void)prepareForReuse
{
  self->_state = 0;
  [(NSMutableDictionary *)self->_storage removeAllObjects];
}

- (void)transitionToNextAvailableState
{
  self->_state = [(MRURoutingSubtitleController *)self nextAvailableTextState];
}

- (void)setText:(id)a3 forState:(int64_t)a4
{
}

- (void)setText:(id)a3 icon:(id)a4 forState:(int64_t)a5
{
}

- (void)setText:(id)a3 forState:(int64_t)a4 accessory:(int64_t)a5
{
}

- (void)setText:(id)a3 icon:(id)a4 forState:(int64_t)a5 accessory:(int64_t)a6
{
  id v21 = a3;
  id v10 = a4;
  storage = self->_storage;
  v12 = [NSNumber numberWithInteger:self->_state];
  v13 = [(NSMutableDictionary *)storage objectForKeyedSubscript:v12];

  if ([v21 length])
  {
    v14 = [[MRUSubtitleValue alloc] initWithText:v21 icon:v10 accessory:a6];
    v15 = self->_storage;
    v16 = [NSNumber numberWithInteger:a5];
    [(NSMutableDictionary *)v15 setObject:v14 forKey:v16];
  }
  else
  {
    v17 = self->_storage;
    v16 = [NSNumber numberWithInteger:a5];
    [(NSMutableDictionary *)v17 removeObjectForKey:v16];
    v14 = 0;
  }

  if (!self->_state && [(MRURoutingSubtitleController *)self hasText]) {
    [(MRURoutingSubtitleController *)self transitionToNextAvailableState];
  }
  int64_t state = self->_state;
  if (state && state == a5 && ([v13 isEqualToSubtitleValue:v14] & 1) == 0)
  {
    v19 = [(MRURoutingSubtitleController *)self delegate];
    v20 = [(MRUSubtitleValue *)v14 text];
    objc_msgSend(v19, "routingSubtitleStateController:didUpdateText:icon:accessory:", self, v20, v10, -[MRUSubtitleValue accessory](v14, "accessory"));
  }
}

- (int64_t)nextAvailableTextState
{
  int64_t state = self->_state;
  int64_t v4 = state;
  while (1)
  {
    uint64_t v5 = ((unint64_t)(v4 + 1) * (unsigned __int128)0x2492492492492493uLL) >> 64;
    int64_t v4 = v4 + 1 - 7 * ((v5 + ((unint64_t)(v4 + 1 - v5) >> 1)) >> 2);
    if (v4 == state) {
      break;
    }
    storage = self->_storage;
    objc_super v7 = [NSNumber numberWithInteger:v4];
    v8 = [(NSMutableDictionary *)storage objectForKeyedSubscript:v7];

    if (v8) {
      return v4;
    }
  }
  return state;
}

- (int64_t)state
{
  return self->_state;
}

- (MRURoutingSubtitleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRURoutingSubtitleControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end