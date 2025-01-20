@interface IOKPowerNotifier
- (IOKPowerNotifier)initWithDispatchQueue:(id)a3;
- (IOKPowerNotifierDelegate)delegate;
- (void)_handlePowerNotificationWithMessageType:(unsigned int)a3 andArgument:(int64_t)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)systemHasPoweredOn;
- (void)systemWillNotSleep;
- (void)systemWillPowerOn;
- (void)systemWillSleep;
@end

@implementation IOKPowerNotifier

- (IOKPowerNotifier)initWithDispatchQueue:(id)a3
{
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IOKPowerNotifier;
  v5 = [(IOKPowerNotifier *)&v10 init];
  v6 = v5;
  if (v5)
  {
    p_notificationPort = &v5->_notificationPort;
    io_connect_t v8 = IORegisterForSystemPower(v5, &v5->_notificationPort, (IOServiceInterestCallback)IOKPowerNotifierCallback, &v5->_notifier);
    v6->_connection = v8;
    if (v8 && v6->_notifier && *p_notificationPort)
    {
      IONotificationPortSetDispatchQueue(*p_notificationPort, v4);
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

- (void)_handlePowerNotificationWithMessageType:(unsigned int)a3 andArgument:(int64_t)a4
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  switch((v4 >> 4))
  {
    case 0u:
      goto LABEL_3;
    case 1u:
      [(IOKPowerNotifier *)self systemWillSleep];
LABEL_3:
      io_connect_t connection = self->_connection;
      IOAllowPowerChange(connection, a4);
      break;
    case 2u:
      [(IOKPowerNotifier *)self systemWillNotSleep];
      break;
    case 9u:
      [(IOKPowerNotifier *)self systemHasPoweredOn];
      break;
    case 0xBu:
      [(IOKPowerNotifier *)self systemWillPowerOn];
      break;
    default:
      return;
  }
}

- (void)systemWillSleep
{
  uint64_t v3 = [(IOKPowerNotifier *)self delegate];
  if (v3)
  {
    unint64_t v4 = (void *)v3;
    v5 = [(IOKPowerNotifier *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(IOKPowerNotifier *)self delegate];
      [v7 systemWillSleepWithNotifier:self];
    }
  }
}

- (void)systemWillPowerOn
{
  uint64_t v3 = [(IOKPowerNotifier *)self delegate];
  if (v3)
  {
    unint64_t v4 = (void *)v3;
    v5 = [(IOKPowerNotifier *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(IOKPowerNotifier *)self delegate];
      [v7 systemWillPowerOnWithNotifier:self];
    }
  }
}

- (void)systemWillNotSleep
{
  uint64_t v3 = [(IOKPowerNotifier *)self delegate];
  if (v3)
  {
    unint64_t v4 = (void *)v3;
    v5 = [(IOKPowerNotifier *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(IOKPowerNotifier *)self delegate];
      [v7 systemWillNotSleepWithNotifier:self];
    }
  }
}

- (void)systemHasPoweredOn
{
  uint64_t v3 = [(IOKPowerNotifier *)self delegate];
  if (v3)
  {
    unint64_t v4 = (void *)v3;
    v5 = [(IOKPowerNotifier *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(IOKPowerNotifier *)self delegate];
      [v7 systemHasPoweredOnWithNotifier:self];
    }
  }
}

- (void)dealloc
{
  unsigned int notifier = self->_notifier;
  p_unsigned int notifier = &self->_notifier;
  if (notifier) {
    IODeregisterForSystemPower(p_notifier);
  }
  io_connect_t connection = self->_connection;
  if (connection) {
    IOServiceClose(connection);
  }
  notificationPort = self->_notificationPort;
  if (notificationPort) {
    IONotificationPortDestroy(notificationPort);
  }
  v7.receiver = self;
  v7.super_class = (Class)IOKPowerNotifier;
  [(IOKPowerNotifier *)&v7 dealloc];
}

- (IOKPowerNotifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IOKPowerNotifierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end