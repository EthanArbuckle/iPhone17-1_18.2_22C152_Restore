@interface _IDSDatagramChannel
- (_IDSDatagramChannel)init;
@end

@implementation _IDSDatagramChannel

- (_IDSDatagramChannel)init
{
  v5.receiver = self;
  v5.super_class = (Class)_IDSDatagramChannel;
  v2 = [(_IDSDatagramChannel *)&v5 init];
  if (v2)
  {
    v2->_verboseFunctionalLogging = IMGetDomainBoolForKey();
    v3 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRemoteRelayLinkIDToVirtualLinkIDMap, 0);
  objc_storeStrong((id *)&self->_linkIDToParticipantMap, 0);
  for (uint64_t i = 4408; i != 2360; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i != 312);
  objc_storeStrong((id *)&self->_probingDict, 0);
  objc_storeStrong((id *)&self->_firstPacketArrivalTimeForMKI, 0);
  objc_storeStrong((id *)&self->_MKIArrivalTime, 0);
  objc_storeStrong((id *)&self->_sendingMetadata, 0);
  objc_storeStrong((id *)&self->_preConnectionData, 0);
  objc_storeStrong((id *)&self->_linkContexts, 0);
  objc_storeStrong((id *)&self->_cellularLink, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_writeHandler, 0);
  objc_storeStrong(&self->_readHandlerWithOptions, 0);
  objc_storeStrong(&self->_readHandler, 0);

  objc_storeStrong(&self->_eventHandler, 0);
}

@end