@interface _BKSCloneMirroringModeRequest
- (NSString)displayUUID;
- (unint64_t)mode;
- (void)setDisplayUUID:(id)a3;
- (void)setMode:(unint64_t)a3;
@end

@implementation _BKSCloneMirroringModeRequest

- (void).cxx_destruct
{
}

- (void)setDisplayUUID:(id)a3
{
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

@end