@interface CUHomeKitFindPairedPeerContext
- (BOOL)triedAccessory;
- (BOOL)triedHAP;
- (BOOL)triedHomeRepairFlow;
- (CUPairedPeer)pairedPeer;
- (NSArray)users;
- (NSString)identifier;
- (id)completion;
- (unint64_t)options;
- (unint64_t)startTicks;
- (unint64_t)userCount;
- (unint64_t)userIndex;
- (void)setCompletion:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPairedPeer:(id)a3;
- (void)setStartTicks:(unint64_t)a3;
- (void)setTriedAccessory:(BOOL)a3;
- (void)setTriedHAP:(BOOL)a3;
- (void)setTriedHomeRepairFlow:(BOOL)a3;
- (void)setUserCount:(unint64_t)a3;
- (void)setUserIndex:(unint64_t)a3;
- (void)setUsers:(id)a3;
@end

@implementation CUHomeKitFindPairedPeerContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_pairedPeer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_completion, 0);
}

- (void)setUserCount:(unint64_t)a3
{
  self->_userCount = a3;
}

- (unint64_t)userCount
{
  return self->_userCount;
}

- (void)setUserIndex:(unint64_t)a3
{
  self->_userIndex = a3;
}

- (unint64_t)userIndex
{
  return self->_userIndex;
}

- (void)setUsers:(id)a3
{
}

- (NSArray)users
{
  return self->_users;
}

- (void)setStartTicks:(unint64_t)a3
{
  self->_startTicks = a3;
}

- (unint64_t)startTicks
{
  return self->_startTicks;
}

- (void)setTriedHomeRepairFlow:(BOOL)a3
{
  self->_triedHomeRepairFlow = a3;
}

- (BOOL)triedHomeRepairFlow
{
  return self->_triedHomeRepairFlow;
}

- (void)setTriedHAP:(BOOL)a3
{
  self->_triedHAP = a3;
}

- (BOOL)triedHAP
{
  return self->_triedHAP;
}

- (void)setTriedAccessory:(BOOL)a3
{
  self->_triedAccessory = a3;
}

- (BOOL)triedAccessory
{
  return self->_triedAccessory;
}

- (void)setPairedPeer:(id)a3
{
}

- (CUPairedPeer)pairedPeer
{
  return self->_pairedPeer;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

@end