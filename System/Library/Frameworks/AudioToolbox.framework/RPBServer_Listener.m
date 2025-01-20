@interface RPBServer_Listener
- (BOOL)respondsToSelector:(SEL)a3;
- (RPBServer_Listener)initWithServer:(id)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)remoteProcessingBlockServerDidStartRunning:(id)a3;
- (void)remoteProcessingBlockServerDidStopRunning:(id)a3;
- (void)remoteProcessingBlockServerWillStartRunning:(id)a3;
- (void)remoteProcessingBlockServerWillStopRunning:(id)a3;
@end

@implementation RPBServer_Listener

- (RPBServer_Listener)initWithServer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPBServer_Listener;
  v5 = [(RPBServer_Listener *)&v9 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_server, v4);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_server);
  [WeakRetained addListener:v6];

  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  [WeakRetained removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)RPBServer_Listener;
  [(RPBServer_Listener *)&v4 dealloc];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_remoteProcessingBlockServerWillStartRunning_ == a3)
  {
    f = self->will_start_running_callback.__f_.__f_;
  }
  else if (sel_remoteProcessingBlockServerDidStartRunning_ == a3)
  {
    f = self->did_start_running_callback.__f_.__f_;
  }
  else if (sel_remoteProcessingBlockServerWillStopRunning_ == a3)
  {
    f = self->will_stop_running_callback.__f_.__f_;
  }
  else
  {
    if (sel_remoteProcessingBlockServerDidStopRunning_ != a3)
    {
      v5.receiver = self;
      v5.super_class = (Class)RPBServer_Listener;
      return -[RPBServer_Listener respondsToSelector:](&v5, sel_respondsToSelector_);
    }
    f = self->did_stop_running_callback.__f_.__f_;
  }
  return f != 0;
}

- (void)remoteProcessingBlockServerWillStartRunning:(id)a3
{
  f = self->will_start_running_callback.__f_.__f_;
  if (f) {
    (*(void (**)(void))(*(void *)f + 48))();
  }
}

- (void)remoteProcessingBlockServerDidStartRunning:(id)a3
{
  f = self->did_start_running_callback.__f_.__f_;
  if (f) {
    (*(void (**)(void))(*(void *)f + 48))();
  }
}

- (void)remoteProcessingBlockServerWillStopRunning:(id)a3
{
  f = self->will_stop_running_callback.__f_.__f_;
  if (f) {
    (*(void (**)(void))(*(void *)f + 48))();
  }
}

- (void)remoteProcessingBlockServerDidStopRunning:(id)a3
{
  f = self->did_stop_running_callback.__f_.__f_;
  if (f) {
    (*(void (**)(void))(*(void *)f + 48))();
  }
}

- (void).cxx_destruct
{
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](self->did_stop_running_callback.__f_.__buf_.__lx);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](self->will_stop_running_callback.__f_.__buf_.__lx);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](self->did_start_running_callback.__f_.__buf_.__lx);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](self->will_start_running_callback.__f_.__buf_.__lx);

  objc_destroyWeak((id *)&self->_server);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 17) = 0;
  return self;
}

@end