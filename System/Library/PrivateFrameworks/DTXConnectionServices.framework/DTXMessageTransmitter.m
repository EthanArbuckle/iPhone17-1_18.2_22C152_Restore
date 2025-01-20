@interface DTXMessageTransmitter
- (unsigned)fragmentsForLength:(unint64_t)a3;
- (unsigned)suggestedFragmentSize;
- (void)setSuggestedFragmentSize:(unsigned int)a3;
- (void)transmitMessage:(id)a3 routingInfo:(DTXMessageRoutingInfo)a4 fragment:(unsigned int)a5 transmitter:(id)a6;
@end

@implementation DTXMessageTransmitter

- (unsigned)fragmentsForLength:(unint64_t)a3
{
  if ([self suggestedFragmentSize:a2 with:a3] < 0x21) {
    return 1;
  }
  unint64_t v8 = (a3 - 1) / (objc_msgSend_suggestedFragmentSize(self, v5, v6) - 32);
  if ((v8 + 1) <= 1) {
    return v8 + 1;
  }
  else {
    return v8 + 2;
  }
}

- (void)transmitMessage:(id)a3 routingInfo:(DTXMessageRoutingInfo)a4 fragment:(unsigned int)a5 transmitter:(id)a6
{
  uint64_t v8 = *(void *)&a4.var2;
  uint64_t v9 = *(void *)&a4.var0;
  id v12 = a3;
  v15 = (void (**)(id, uint64_t *, uint64_t))a6;
  if (!v12)
  {
    v24 = [MEMORY[0x263F08690] currentHandler:v13 withTransitionContext:v14];
    [v24 _DTXMessageProtocols_DTXMessageProtocols_m_236_Invalid_parameter_not_satisfying__message_:a2];
  }
  uint64_t v16 = [v12 _objc_msgSend_serializedLength:v13 with:v14];
  unsigned int v18 = [self fragmentsForLength:v17 withOptions:v16];
  if (v18 <= a5) {
    sub_22AF5304C();
  }
  uint64_t v36 = 0x201F3D5B79;
  __int16 v37 = a5;
  __int16 v38 = v18;
  int v39 = v16;
  uint64_t v40 = v9;
  uint64_t v41 = v8;
  if (v18 == 1)
  {
    v15[2](v15, &v36, 32);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = sub_22AF4A1E4;
    v34[3] = &unk_264884368;
    v35 = v15;
    [v12 _serializedFormApply:v21 withTransitionContext:v34];
  }
  else if (a5)
  {
    unint64_t v22 = [self suggestedFragmentSize:v19 withFragmentSize:v20] - 32;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    uint64_t v33 = v22 * (a5 - 1);
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    if (v16 - v33 < v22) {
      LODWORD(v22) = v16 - v33;
    }
    int v31 = v22;
    int v39 = v22;
    v15[2](v15, &v36, 32);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = sub_22AF4A1F4;
    v26[3] = &unk_264884390;
    v28 = v30;
    v29 = v32;
    v27 = v15;
    [v12 _serializedFormApply:v23];

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(v32, 8);
  }
  else
  {
    v15[2](v15, &v36, 32);
  }
}

- (unsigned)suggestedFragmentSize
{
  return self->_suggestedFragmentSize;
}

- (void)setSuggestedFragmentSize:(unsigned int)a3
{
  self->_suggestedFragmentSize = a3;
}

@end